import 'package:flutter/material.dart';

class Story {
  final ImageProvider img;
  final bool newPost;

  Story({this.img, this.newPost});
}

List<Story> storys = [
  Story(
    img: AssetImage('assets/face.jpg'),
    newPost: false,
  ),
  Story(
    img: AssetImage('assets/face1.jpg'),
    newPost: false,
  ),
  Story(
    img: AssetImage('assets/face2.jpg'),
    newPost: true,
  ),
  Story(
    img: AssetImage('assets/face3.jpg'),
    newPost: true,
  ),
  Story(
    img: AssetImage('assets/face4.jpg'),
    newPost: false,
  ),
  Story(
    img: AssetImage('assets/face5.jpg'),
    newPost: true,
  ),
  Story(
    img: AssetImage('assets/face6.jpg'),
    newPost: false,
  ),
];

class Post {
  final ImageProvider img;
  final String name;
  final ImageProvider avatar;

  Post({this.img, this.name, this.avatar});
}

List<Post> posts = [
  Post(
    img: AssetImage('assets/third.jpg'),
    name: 'Jakob_Owens',
    avatar: AssetImage('assets/face.jpg'),
  ),
  Post(
    img: AssetImage('assets/second.jpg'),
    name: 'Peter_Range',
    avatar: AssetImage('assets/face5.jpg'),
  ),
  Post(
    img: AssetImage('assets/first.jpg'),
    name: 'Jakob_Owens',
    avatar: AssetImage('assets/face.jpg'),
  ),
  Post(
    img: AssetImage('assets/fourth.jpg'),
    name: 'Jakob_Owens',
    avatar: AssetImage('assets/face.jpg'),
  ),
  Post(
    img: AssetImage('assets/fifth.jpg'),
    name: 'Peter_Range',
    avatar: AssetImage('assets/face5.jpg'),
  ),
  Post(
    img: AssetImage('assets/sixth.jpg'),
    name: 'SmartFox',
    avatar: AssetImage('assets/face4.jpg'),
  ),
];

const String kLogo = 'assets/logo.png';
const String kCamera = 'assets/camera.png';
const String kLive = 'assets/live.png';
const String kDm = 'assets/dm.png';
const Color kBackGroundColor = Color(0xff272936);
const Color kForGroundColor = Color(0xff3d3f50);
