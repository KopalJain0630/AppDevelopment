import 'package:flutter/material.dart';
import 'dart:io';

class Resource {
  final String title;
  final String type;
  final String category;
  final File image;

  Resource(
      {required this.title,
      required this.type,
      required this.category,
      required this.image});
}
