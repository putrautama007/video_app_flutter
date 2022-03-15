import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_app_flutter/method_channel/flutter_method_channel.dart';
import 'package:video_app_flutter/router/news_routes.dart';

import 'utils/navigation/navigation_helper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationHelperImpl.navigatorKey,
      initialRoute: VideoRoutes.home,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case VideoRoutes.home:
            return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'));
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _playlistId = 'empty';

  void _incrementCounter() async {
    try {
      var response =
      await FlutterMethodChannelImpl().getPlaylistId();

      setState(() {
        _playlistId = response;
      });
      print(response);
    } on PlatformException catch (e) {
      print("e.message");
      print(e.message);
    }

    setState(() {

      _counter++;
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _playlistId,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}