import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../provider/sign_in_provider.dart';
import '../../utils/colors.dart';
import 'package:http/http.dart' as http;

import '../../utils/config.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({Key? key}) : super(key: key);

  @override
  State<SavedPlaces> createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
  Position? _currentPosition;

  Future<String?> getToken(String? email) async {
    try {
      var response = await http.post(Uri.parse('${Config.baseURL}/login'),
          body: {"email": email}, headers: {"Accept": "application/json"});
      String token = jsonDecode(response.body)['data']['token'];
      return token;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();

    final token = await getToken(sp.email);

    final response =
        await http.get(Uri.parse("${Config.baseURL}/places"), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 10),
        Text("All Saved Locations Page",
            style: TextStyle(color: AppColors.primaryTextColor)),
      ],
    );
  }
}
