import 'package:flutter/material.dart';
import 'package:edge_alerts/edge_alerts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edge Alert 2 ',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Edge Alert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final longDesc =
      "This is very long description This is very long description This is very long description This is very long description This is very long description";

  void _showAlert(Gravity gravity) {
    edgeAlert(
      context,
      title: 'Title',
      description: 'Description',
      gravity: gravity,
      icon: Icons.hail,
    );
  }

  void _colorfullAlert() {
    edgeAlert(
      context,
      title: 'Title',
      description: 'Description',
      gravity: Gravity.top,
      backgroundColor: Colors.red,
    );
  }

  void _longDescAlert() {
    edgeAlert(
      context,
      title: 'Title',
      description: longDesc,
      gravity: Gravity.top,
    );
  }

  void _differentIcon() {
    edgeAlert(
      context,
      title: 'Title',
      description: 'Description',
      gravity: Gravity.top,
      icon: Icons.disc_full,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showAlert(Gravity.top),
              child: Text('From Top'),
            ),
            ElevatedButton(
              onPressed: () => _showAlert(Gravity.bottom),
              child: Text('From Bottom'),
            ),
            ElevatedButton(
              onPressed: _colorfullAlert,
              child: Text('Colorfull Alert'),
            ),
            ElevatedButton(
              onPressed: _longDescAlert,
              child: Text('Long Description'),
            ),
            ElevatedButton(
              onPressed: _differentIcon,
              child: Text('Different Icon'),
            ),
          ],
        ),
      ),
    );
  }
}
