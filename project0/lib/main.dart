import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: "flutter",
    home: name(),
  ));
}

class name extends StatefulWidget {
  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<name> with SingleTickerProviderStateMixin {
  bool reversed = false;

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: animation.value,
          color: Colors.pink,
        ),
        Container(
          height: 50,
          width: 50,
          color: Colors.amber,
          child: GestureDetector(
            child: Text("data"),
          ),
        )
      ],
    )));
  }
}

class myPaint extends CustomPainter {
  double progress;

  myPaint(this.progress) {}

  @override
  void paint(Canvas canvas, Size size) {
    Paint linepaint = Paint();
    linepaint.strokeWidth = 10;
    linepaint.color = Colors.amber;

    canvas.drawLine(
        Offset(-150, -200),
        Offset(size.width - size.width * progress,
            size.height - size.height * progress),
        linepaint);
  }

  @override
  bool shouldRepaint(myPaint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(myPaint oldDelegate) => false;
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation = Tween(begin: -1.0, end: 0.4).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Transform(
          transform:
              Matrix4.translationValues(animation.value * width, 10.0, 10.0),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }
}
