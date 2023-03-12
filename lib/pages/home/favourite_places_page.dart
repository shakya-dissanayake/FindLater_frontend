import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:provider/provider.dart';
import '../../provider/sign_in_provider.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:http/http.dart' as http;


class FavouritePlaces extends StatefulWidget {
  const FavouritePlaces({Key? key}) : super(key: key);

  @override
  State<FavouritePlaces> createState() => _FavouritePlacesState();
}

class _FavouritePlacesState extends State<FavouritePlaces> {
  bool _isLoaded = false;
  String _response = "{}";

  Future<String?> getToken(String? email) async {
    try {
      var response = await http.post(Uri.parse('${Config.baseURL}/login'),
          body: {"email": email}, headers: {"Accept": "application/json"});
      String token = jsonDecode(response.body)['data']['token'];
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

    await http.get(Uri.parse("${Config.baseURL}/places?is_favourite=1"), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) => {
      setState(() => _response = response.body),
      setState(() => _isLoaded = true ),
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
