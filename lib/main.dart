import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _MyPainter extends CustomPainter {
  _MyPainter() : super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;
    final path = Path();
    const inset = 10.0;
    const minX = inset;
    final maxX = size.width - inset;
    const minY = inset;
    final maxY = size.height - inset;
    // Create a List of points for a triangle.
    var points = <Offset>[
      Offset((minX + maxX) / 2, minY),
      Offset(maxX, maxY),
      Offset(minX, maxY),
    ];
    path.addPolygon(points, true); // true to close
    path.close();
    canvas.drawPath(path, paint);
  }

  // false optimizes for drawings that never change.
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
        child: ListView(
          children: <Widget>[
            _buildCustomPaint(),
            _buildImage(),
            SvgPicture.asset('assets/images/github.svg'),
            _buildText(),
            _buildRichText(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomPaint() {
    // Can also pass this a child argument that can be any widget.
    return CustomPaint(
      painter: _MyPainter(),
      child: SizedBox(width: 200, height: 100),
    );
  }

  ClipOval _buildImage() {
    return ClipOval(
      child: Image.asset(
        'assets/images/comet.jpg',
        //fit: BoxFit.cover,
      ),
    );
  }

  RichText _buildRichText() {
    return RichText(
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
            text: 'Second line that is even longer just to be annoying.',
            style: TextStyle(color: Colors.green),
          ),
          TextSpan(
            text: 'Third line that is somewhat shorter.',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Text _buildText() {
    return Text(
      'This is a really long run of text that definitely will need to wrap. But does Flutter do this by default?',
    );
  }
}
