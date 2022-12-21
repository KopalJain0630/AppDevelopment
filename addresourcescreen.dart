import 'package:first_app/providers/resources.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/imageinput.dart';
import 'package:provider/provider.dart';

class AddResourceScreen extends StatefulWidget {
  static const routeName = '/add-resource';

  @override
  State<AddResourceScreen> createState() => _AddResourceScreenState();
}

class _AddResourceScreenState extends State<AddResourceScreen> {
  final _titleController = TextEditingController();
  late File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveResource() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Resources>(context, listen: false)
        .addResource(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add a new Resource')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10),
                      ImageInput(_selectImage)
                    ],
                  ),
                ),
              )),
              RaisedButton.icon(
                onPressed: _saveResource,
                icon: Icon(Icons.add),
                label: Text('Add Resource'),
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
              )
            ]));
  }
}
