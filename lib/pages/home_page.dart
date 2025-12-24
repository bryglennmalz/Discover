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
          return Stack(
            fit: StackFit.loose,
            children: [
              Padding(
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
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width * 0.10,
                child: _socialInfoContainer(context, index),
              ),
            ],
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
        Padding(
          padding: EdgeInsets.fromLTRB(
            30,
            MediaQuery.of(context).size.height * 0.05,
            30,
            0,
          ),
          child: _detailInfoRow(context, index),
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
            Icon(Icons.bookmark_add_outlined, color: Colors.white, size: 20),
          ],
        ),
      ],
    );
  }

  Widget _detailInfoRow(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        MediaQuery.of(context).size.height * 0,
        0,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            child: Icon(Icons.play_arrow, color: Colors.redAccent, size: 30),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  articles[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                ),
              ),
              Text(
                articles[index].location,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 3), child: _ratingWidget(context, index),)
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext context, int index) {
    return Row(
      children: List.generate(5, (_currentIndex) {
        double _fillAmount = articles[index].rating - _currentIndex;
        Icon _starIcon;

        if (_fillAmount >= 1) {
          _starIcon = Icon(Icons.star, color: Colors.amberAccent, size: 15);
        } else if (_fillAmount >= 0.5) {
          _starIcon = Icon(
            Icons.star_half,
            color: Colors.amberAccent,
            size: 15,
          );
        } else {
          _starIcon = Icon(
            Icons.star_border,
            color: Colors.amberAccent,
            size: 15,
          );
        }

        return _starIcon;
      }),
    );
  }

  Widget _socialInfoContainer(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up, color: Colors.redAccent),
              SizedBox(width: 3),
              Text(
                articles[index].likes.toString(),
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.comment, color: Colors.grey),
              SizedBox(width: 3),
              Text(
                articles[index].comments.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.share, color: Colors.grey),
              SizedBox(width: 3),
              Text(
                articles[index].shares.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
