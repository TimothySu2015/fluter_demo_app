import 'dart:math';
import 'package:flutter/material.dart';

class DemoCanvas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoCanvasState();
  }
}

class _DemoCanvasState extends State<DemoCanvas> {
  Size dashBoardSize;

  int _myVal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashBoardSize = Size(200.0, 200.0);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // this._myVal = 0;
    print('didChangeDependencies');
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    //   print('setState');
    print('myval:${this._myVal}');
  }

  @override
  Widget build(BuildContext context) {
    print('aa');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas Demo'),
      ),
      backgroundColor: Colors.lime,
      body: CustomPaint(
        size: dashBoardSize,
        painter: DemoPainter(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
//          setState(() {
//            this._myVal = 0;
//          });
//
          setState(() {
            this._myVal = 62000;
          });

//          print('a');
//          //print(_val);
//          for (var t = 0; t < 5000; t += 300) {
//            Future.delayed(const Duration(milliseconds: 3000), () {
//              print(t);
//
//              setState(() {
//                this._myVal = t;
//              });
//            });
//          }
        },
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   double halfWidth = size.width / 2;
   double halfHeight = size.height / 2;
   canvas.translate(halfWidth, halfHeight);
//    canvas.save();

var rect =Rect.fromLTWH(75, 75, 50, 50);

  var gradient = RadialGradient(
    center: const Alignment(0.7, -0.6), // near the top right
    radius: 0.2,
    colors: [
      const Color(0xFFFFFF00), // yellow sun
      const Color(0xFF0099FF), // blue sky
    ],
    stops: [0.4, 1.0],
  );
  // rect is the area we are painting over
  var paint = Paint()
    ..shader = gradient.createShader(rect);


    Paint paintBorder = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    Paint paintBorder2 = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    canvas.drawColor(Colors.red, BlendMode.lighten);
    canvas.save();
    // canvas.rotate(0);
    canvas.drawRect(Rect.fromLTWH(10, 10, 190, 190), paintBorder2);
    canvas.drawRect(Rect.fromLTWH(20, 20, 50, 50), paintBorder);
    canvas.rotate(pi*2);
    canvas.drawRect(rect, paint);
    canvas.restore();
    canvas.drawRect(Rect.fromLTWH(130, 130, 50, 50), paintBorder);
     print('------');
     double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
     print('r:${r}');




  //canvas.drawRect(rect, paint);



    //   canvas.restore();
    // canvas.rotate(0.1);
    // canvas.drawRect(Rect.fromLTWH(11, 11, 50, 50), paintBorder);
    //  canvas.rotate(0.2);
    //  canvas.drawRect(Rect.fromLTWH(11, 11, 50, 50), paintBorder);
    //   canvas.rotate(0.3);
    //   canvas.drawRect(Rect.fromLTWH(11, 11, 50, 50), paintBorder);
//    canvas.restore();
    // canvas.save();
    //canvas.restore();
    //  canvas.drawRect(Rect.fromLTWH(100, 100, 200, 50), paintBorder);

    //  canvas.drawRect(Rect.fromLTWH(100, 100, 50, 200), paintBorder);
    // canvas.save();
    // canvas.drawRect(Rect.fromLTWH(100, 100, 200, 50), paintBorder);
    // canvas.rotate(-20);

    // canvas.save();
    // canvas.restore();

    // canvas.save();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class Arc2Painter extends CustomPainter {
  final int val;

  Arc2Painter({this.val});

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.save();
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    canvas.translate(halfWidth, halfHeight);

    var _scales = List<ScaleInfo>();

    Paint paintBorder = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final center = Offset(halfHeight, halfWidth);

    var r = Rect.fromCircle(center: center, radius: 75);
    canvas.drawCircle(center, 75, paintBorder);
    canvas.drawLine(r.bottomLeft, r.bottomRight, paintBorder);

    var _c = (8000 / 54).toInt();

    var _a = (val / _c).toInt();

    var _count2 = 0;

    for (var t = 135; t <= 405; t += 5) {
      //  if (!(t >= 45 && t <= 135)) {
      var cosT = cos((t / 360) * (pi * 2));
      var sinT = sin((t / 360) * (pi * 2));
      var X = cosT * 90;
      var Y = sinT * 90;
      var pathY = Path()..moveTo(center.dx + X, center.dy + Y);
      var endX = cosT * 130;
      var endY = sinT * 130;
      pathY.lineTo(center.dx + endX, center.dy + endY);

      _scales.add(ScaleInfo(_count2, Offset(X, Y), Offset(endX, endY)));
      canvas.drawPath(pathY, paintBorder);
      pathY.close();
      _count2++;
    }
    canvas.save();

    canvas.restore();

    void drawPath(int t) {
      Paint paintBorder2 = Paint()
        ..color = Colors.amber
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke;

      var pathY = Path()
        ..moveTo(
            center.dx + _scales[t].start.dx, center.dy + _scales[t].start.dy);
      pathY.lineTo(
          center.dx + _scales[t].end.dx, center.dy + _scales[t].end.dy);

      canvas.drawPath(pathY, paintBorder2);
      pathY.close();
    }

    canvas.save();
    for (var t = 0; t <= _a; t++) {
      if (t < _scales.length) {
        drawPath(t);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBorder = Paint()
      ..color = Colors.red
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    final center = Offset(150, 150);

    double count = 0.0;
    double start = (pi * 2 / 100) * 1;
    var end = (pi * 2 / 100) * 3;

    while (count <= 100) {
      start = (pi * 2 / 100) * count;

      //Rect.fromCircle(center: center, radius: 80).

      canvas.drawArc(Rect.fromCircle(center: center, radius: 80), start, end,
          false, paintBorder);
      count = count + 5;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ScaleInfo {
  final int _num;
  final Offset _start;
  final Offset _end;

  int get num => _num;

  Offset get start => _start;

  Offset get end => _end;

  ScaleInfo(this._num, this._start, this._end) {}
}
