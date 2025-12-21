import 'package:flutter/material.dart';
import 'package:discover_app/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> locations = ['Polure', 'Japan', 'Moscow', 'London'];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          0,
          MediaQuery.of(context).size.width * 0.05,
          0,
        ),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.menu, color: Colors.black87, size: 35),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            Icon(Icons.search, color: Colors.black87, size: 35),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
          child: _locationBar(context),
        ),
        _articleList(context),
      ],
    );
  }

  Widget _locationBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: locations.map((l) {
          bool isActive = locations[_activeLocation] == l ? true : false;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l,
                style: TextStyle(
                  fontFamily: 'Monsterrat',
                  fontSize: 15,
                  color: isActive ? Colors.white70 : Colors.grey[600],
                ),
              ),
              isActive
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 5,
                      width: 50,
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articleList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (contex, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(articles[index].image),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: _articleInfoColumn(context, index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _articleInfoColumn(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authorInfoRow(context, index),
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.pravatar.cc/300'),
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles[index].author,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "3 hours ago",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.favorite,
              color: articles[index].isLiked ? Colors.red : Colors.white,
              size: 20,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.bookmark_add_outlined, 
              color: Colors.white, 
              size: 20,
            ),
          ],
        ),
      ],
    );
  }
}
