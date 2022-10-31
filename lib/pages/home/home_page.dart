import 'package:findlater/pages/home/saved_places_page.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../components/text_semibold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    const TabBar(
                      labelStyle: TextStyle(fontSize: 16, height: 3),
                      labelColor: AppColors.topicTextColor,
                      unselectedLabelColor: AppColors.iconDark,
                      indicatorColor: Colors.white,
                      tabs: [
                        SemiBoldText(
                            text: 'All Saved',
                            size: 16),
                        SemiBoldText(
                            text: 'Favourites',
                            size: 16)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: const <Widget>[SavedPlaces()],
              ),
              Column(
                children: const <Widget>[Text("Cart Page")],
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
