import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<DataModel> imgList = [
    DataModel(
      image: 'assets/image/101_Main Profile 01.png',
      name: '잭과분홍콩나물',
      age: '25',
      decoration: '서울- 2km 거리에 있음',
      likes: '29,930',
      tag: [],
    ),
    DataModel(
      image: 'assets/image/101_Main Profile 02.png',
      name: '잭과분홍콩나물',
      age: '25',
      decoration:
          '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
      likes: '29,930',
      tag: [],
    ),
    DataModel(
      image: 'assets/image/101_Main Profile 03.png',
      name: '잭과분홍콩나물',
      age: '25',
      decoration: '',
      likes: '29,930',
      tag: [
        TagModel(name: "진지한 연애를 찾는 중", tagIcons: "assets/icons/tag5.png"),
        TagModel(name: "전혀 안 함", tagIcons: "assets/icons/tag1.png"),
        TagModel(name: "비흡연", tagIcons: "assets/icons/tag2.png"),
        TagModel(name: "매일 1시간 이상", tagIcons: "assets/icons/tag3.png"),
        TagModel(name: "만나는 걸 좋아함", tagIcons: "assets/icons/tag4.png"),
      ],
    ),
  ];
  int selectedIndex = 0;

  void refresh() {
    notifyListeners();
  }
}

class DataModel {
  final String image;
  final String likes;
  final String name;
  final String age;
  final String decoration;
  final List<TagModel> tag;
  DataModel(
      {required this.image,
      required this.name,
      required this.likes,
      required this.age,
      required this.decoration,
      required this.tag});
}

class TagModel {
  final String name;
  final String tagIcons;

  TagModel({required this.name, required this.tagIcons});
}
// 'assets/image/101_Main Profile 01.png',
//     'assets/image/101_Main Profile 02.png',
//     'assets/image/101_Main Profile 03.png',
