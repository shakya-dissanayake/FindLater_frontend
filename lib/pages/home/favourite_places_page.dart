import 'package:flutter/cupertino.dart';
import '../../utils/colors.dart';


class FavouritePlaces extends StatefulWidget {
  const FavouritePlaces({Key? key}) : super(key: key);

  @override
  State<FavouritePlaces> createState() => _FavouritePlacesState();
}

class _FavouritePlacesState extends State<FavouritePlaces> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 10),
          Text("Favourite Locations Page",
          style: TextStyle(color: AppColors.primaryTextColor)),
        ],
      ),
    );
  }
}
