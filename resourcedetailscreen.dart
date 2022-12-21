import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resources.dart';

class ResourceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments;
    final selectedResource = Provider.of<Resources>(context, listen: false)
        .findByTitle(title.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedResource.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedResource.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            selectedResource.type,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
