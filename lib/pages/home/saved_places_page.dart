import 'package:flutter/cupertino.dart';
import 'package:frontend/utils/colors.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({Key? key}) : super(key: key);

  @override
  State<SavedPlaces> createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
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
