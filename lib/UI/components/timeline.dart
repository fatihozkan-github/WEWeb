import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  int _processIndex = 6;

  double kTileHeight = 50.0;

  Color completeColor = UIColors.primaryColor;
  Color inProgressColor = UIColors.primaryColor;
  Color todoColor = Color(0xffd1d2d7);

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(direction: Axis.horizontal, connectorTheme: ConnectorThemeData(space: 30.0, thickness: 5.0)),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / _processes.length,
        oppositeContentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Image.asset(
              _images[index],
              width: 60.0,
              scale: 0.2,
              // color: getColor(index),
            ),
          );
        },
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              _processes[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: getColor(index),
              ),
            ),
          );
        },
        indicatorBuilder: (_, index) {
          var color;
          var child;
          // if (index == _processIndex) {
          //   color = inProgressColor;
          //   child = Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: CircularProgressIndicator(strokeWidth: 3.0, valueColor: AlwaysStoppedAnimation(Colors.white)),
          //   );
          // } else
          if (index <= _processIndex) {
            color = completeColor;
            child = Icon(Icons.check, color: Colors.white, size: 15.0);
          } else {
            color = todoColor;
          }

          if (index <= _processIndex) {
            return Tooltip(
              message: _tips[index],
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
              decoration: BoxDecoration(color: UIColors.primaryColor, borderRadius: BorderRadius.circular(15.0)),
              padding: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(30.0, 30.0),
                    painter: _BezierPainter(color: color, drawStart: index > 0, drawEnd: index < _processIndex),
                  ),
                  DotIndicator(size: 30.0, color: color, child: child),
                ],
              ),
            );
          } else {
            return Stack(
              children: [
                CustomPaint(
                    size: Size(15.0, 15.0), painter: _BezierPainter(color: color, drawEnd: index < _processes.length - 1)),
                OutlinedDotIndicator(borderWidth: 4.0, color: color),
              ],
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            if (index == _processIndex) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              if (type == ConnectorType.start) {
                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
              } else {
                gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
              }
              return DecoratedLineConnector(decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)));
            } else {
              return SolidLineConnector(color: getColor(index));
            }
          } else {
            return null;
          }
        },
        itemCount: _processes.length,
      ),
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({required this.color, this.drawStart = true, this.drawEnd = true});

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) => Offset(radius * cos(angle) + radius, radius * sin(angle) + radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius, radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius, radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.drawStart != drawStart || oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  '5 Mart \'21',
  '11 Nisan \'21',
  '27 May??s \'21',
  '6 Haziran \'21',
  '2 A??ustos \'21',
  '24 Ekim \'21',
  'Stay tuned',
];

final _images = [
  'assets/googlev2.png',
  'assets/google_logo.png',
  'assets/arya.png',
  'assets/itucekirdek.png',
  'assets/sc.png',
  'assets/borusan.png',
  'assets/is.png',
];

final _tips = [
  'GOOGLE DSC T??rkiye\nPeople&Peace Hackathon 1.',
  'GOOGLE Global Solution\nChallenge Top 50',
  'Arya WIP Yat??r??ma\nHaz??rl??k H??zland??rma Program??\'na kab??l',
  '??T?? ??ekirdek\n??n Kulu??kaya kabul',
  'Solution Challenge\nIncubation Program Top Startups',
  '??r??nlerimiz Kullan??l??yor',
  'Bizden Haber Bekleyin',
];
