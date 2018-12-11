import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Demo 页',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            backgroundColor: Colors.green,
          ),
          body: new Container(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Text('Demo Page'),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('go back'),
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
