import 'package:flutter/material.dart';
import './config.dart';

class DarkInstagram extends StatefulWidget {
  @override
  _DarkInstagramState createState() => _DarkInstagramState();
}

class _DarkInstagramState extends State<DarkInstagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomHeader(),
              PostsView(),
            ],
          ),
          NavBar(),
        ],
      ),
    );
  }
}

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 100),
        itemCount: posts.length,
        itemBuilder: (context, index) => Post(
          img: posts[index].img,
          name: posts[index].name,
          avatar: posts[index].avatar,
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final ImageProvider img;
  final String name;
  final ImageProvider avatar;

  const Post({this.img, this.name, this.avatar});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 450,
      decoration: BoxDecoration(
        color: kForGroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(radius: 18, backgroundImage: avatar),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Icon(Icons.more_horiz)
            ],
          ),
          Container(
            height: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(fit: BoxFit.cover, image: img),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.redAccent),
              Text('1.245', style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(width: 20),
              Icon(Icons.chat_bubble_outline),
              Text(' 54', style: TextStyle(fontWeight: FontWeight.w500),),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          )
        ],
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: kForGroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      kCamera,
                      width: 35,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(kLogo),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(kLive, width: 35),
                      Image.asset(kDm, width: 35),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storys.length,
              itemBuilder: (context, index) => NewStory(
                image: storys[index].img,
                newStory: storys[index].newPost,
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewStory extends StatelessWidget {
  final ImageProvider image;
  final bool newStory;
  final int index;
  const NewStory({this.image, this.newStory, this.index});
  @override
  Widget build(BuildContext context) {
    bool postStory = index == 0;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: postStory ? Colors.blueAccent : null,
              gradient: newStory
                  ? LinearGradient(
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                      colors: [Colors.orange.shade400, Colors.pink],
                    )
                  : null,
              shape: BoxShape.circle),
          child: Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(2),
            decoration:
                BoxDecoration(color: kForGroundColor, shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: image,
            ),
          ),
        ),
        postStory
            ? Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent.withOpacity(0.5)),
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        IgnorePointer(
          child: Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 50),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  kBackGroundColor,
                  kBackGroundColor.withOpacity(0.01),
                ],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: BottomBarClipper(),
          child: Container(
            height: 105,
            width: MediaQuery.of(context).size.width,
            color: kForGroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.home, size: 28),
                  Icon(Icons.search, size: 28),
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.orange.shade400.withOpacity(0.6),
                          Colors.pink
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.deepOrangeAccent.shade100.withOpacity(0.3),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                        child: Text('+',
                            style: TextStyle(fontWeight: FontWeight.w200))),
                  ),
                  Icon(Icons.favorite_border, size: 28),
                  Icon(Icons.perm_identity, size: 28),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.moveTo(0, sh * 0.35);
    path.lineTo(sw * 0.3, sh * 0.35);
    path.cubicTo(sw * 0.4, sh * 0.35, sw * 0.4, 0, sw * 0.5, 0);
    path.cubicTo(sw * 0.6, 0, sw * 0.6, sh * 0.35, sw * 0.7, sh * 0.35);
    path.lineTo(sw, sh * 0.35);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
