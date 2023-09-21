import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nggoa/theme/my_theme.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _tabController,
          indicatorColor: MyColors.textPurpal,
          labelColor: MyColors.textPurpal,
          unselectedLabelColor: Colors.black,
          tabs: const <Widget>[
            Tab(text: 'All'),
            Tab(text: 'OPENING CEREMONY'),
            Tab(text: 'GAMES'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              gridview(),
              gridview(),
              gridview(),
            ],
          ),
        ),
      ],
    );
  }

  Widget gridview() {
    return Center(
        child: GridView.count(
      primary: false,
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/png/news_images_3.jpg"),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/png/news_images_2.jpeg"),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/png/new_image_1.jpg"),
            ),
          ),
        )
      ],
    ));
  }
}
