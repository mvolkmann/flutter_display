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

class _MyPainter extends CustomPainter {
  _MyPainter() : super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final path = Path();
    const inset = 10.0;
    const minX = inset;
    final maxX = size.width - inset;
    const minY = inset;
    final maxY = size.height - inset;
    path.moveTo(minX, minY);
    path.lineTo(maxX, minY);
    path.lineTo((minX + maxX) / 2, maxY);
    path.lineTo(minX, minY);
    // Other Path methods include:
    // addArc, addOval, addPath, addPolygon, addRect, addRRect,
    // arcTo, arcToPoint, conicTo, cubicTo, quadraticBezierTo,
    // relativeArcToPoint, relativeConicTo, relativeLineTo,
    // relativeMoveTo, relativeQuadraticBezierTo,
    // reset, shift, and transform.
    // Also see the static Path method combine.
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCustomPaint(),
            _buildImage(),
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
