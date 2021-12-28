import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Json from Local'),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: showData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(showData[index]['empName']),
                    subtitle: Text(showData[index]['Department']),
                  );
                });
          },
          future:
              DefaultAssetBundle.of(context).loadString('assets/empRcd.json'),
        ),
      ),
    );
  }
}
