import 'package:flutter/material.dart';
import '../models/resource.dart';
import 'dart:io';
import '../models/resource.dart';
import 'package:sqflite/sqflite.dart' as sql;
import '../helpers/dbhelper.dart';

class Resources with ChangeNotifier {
  List<Resource> _items = [];
  List<Resource> get items {
    return [..._items];
  }

  Resource findByTitle(String title) {
    return _items.firstWhere((element) => element.title == title);
  }

  void addResource(
    String pickedTitle,
    File pickedImage,
  ) {
    final newResource = Resource(
        image: pickedImage,
        title: pickedTitle,
        category: 'Article',
        type: 'Your Own!');
    _items.add(newResource);
    notifyListeners();
    DBHelper.insert('user_Resources', {
      'title': newResource.title,
      'image': newResource.image.path,
      'type': newResource.type
    });
  }

  Future<void> fetchAndSetResources() async {
    List dataList = [];
    //dataList = await DBHelper.getData('user_Resources');
    _items = dataList
        .map((item) => Resource(
            title: item['title'],
            type: item['type'],
            category: item['category'],
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
