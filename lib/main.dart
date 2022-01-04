import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Display Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Display Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                'assets/images/comet.jpg',
                //fit: BoxFit.cover,
              ),
            ),
            Text(
              'This is a really long run of text that definitely will need to wrap. But does Flutter do this by default?',
            ),
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                //text: 'First',
                //style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                    text: 'First line that is very, very long.',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text:
                        'Second line that is even longer just to be annoying.',
                    style: TextStyle(color: Colors.green),
                  ),
                  TextSpan(
                    text: 'Third line that is somewhat shorter.',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
