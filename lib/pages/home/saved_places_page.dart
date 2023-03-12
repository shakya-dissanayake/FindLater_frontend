import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../provider/sign_in_provider.dart';
import '../../utils/colors.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:http/http.dart' as http;

import '../../utils/config.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({Key? key}) : super(key: key);

  @override
  State<SavedPlaces> createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
  Position? _currentPosition;
  bool _isLoaded = false;
  String _response = "{}";

  Future<String?> getToken(String? email) async {
    try {
      var response = await http.post(Uri.parse('${Config.baseURL}/login'),
          body: {"email": email}, headers: {"Accept": "application/json"});
      String token = jsonDecode(response.body)['data']['token'];
      debugPrint(token);
      return token;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();

    String? token = await getToken(sp.email);

    await http.get(Uri.parse("${Config.baseURL}/places"), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) => {
      setState(() => _response = response.body ),
      setState(() => _isLoaded = true )
    });
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _isLoaded ? jsonDecode(_response) is Map<String, dynamic> ?
        HighlightView(
            _prettyJson(jsonDecode(_response)),
            language: 'json',
            theme: vs2015Theme,
            textStyle: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
            ),
            padding: const EdgeInsets.all(12)) :
        const Text("No Data to Show",
            style: TextStyle(
                fontFamily: 'Monospace',
                fontSize: 12,
                color: AppColors.primaryTextColor
            )) :
        const Text("Loading...",
            style: TextStyle(
                fontFamily: 'Monospace',
                fontSize: 12,
                color: AppColors.primaryTextColor
            ))
    ));
  }

  String _prettyJson(Map<String, dynamic> data) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(data);
    return jsonString;
  }
}
