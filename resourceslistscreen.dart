import 'package:flutter/material.dart';
import './addresourcescreen.dart';
import 'package:provider/provider.dart';
import '../providers/resources.dart';
import '../models/resource.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddResourceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
        title: Text('Your Resources'),
      ),
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      body: FutureBuilder(
        future: Provider.of<Resources>(context, listen: false)
            .fetchAndSetResources(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Resources>(
                child: Center(
                    child:
                        const Text('Got no resources yet, start adding some!')),
                builder: (ctx, resources, ch) => resources.items.length <= 0
                    ? ch!
                    : ListView.builder(
                        itemCount: resources.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(resources.items[i].image),
                          ),
                          title: Text(resources.items[i].title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
