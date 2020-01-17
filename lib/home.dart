import 'package:car_app/car.dart';
import 'package:car_app/size_scale_config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SizeScaleConfig sizeScaleConfig = SizeScaleConfig();
  Car car = Car();
  bool isCarInitialized = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Size screenSize = MediaQuery.of(context).size;
    SizeScaleConfig.screenHeight = screenSize.height;
    SizeScaleConfig.screenWidth = screenSize.width;
    SizeScaleConfig().calculateScaleRatios();

    SizeScaleConfig.scaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    if (!isCarInitialized) {
      car.calculateRelative(width: SizeScaleConfig.screenWidth);
      isCarInitialized = true;
    }
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Color(0xff33499c),
        appBar: AppBar(
          backgroundColor: Color(0xff324796),
          title: Text('Car Model Mapping Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: SizeScaleConfig.screenWidth,
              child: Stack(
                children: _getImageStack(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getImageStack() {
    List<Widget> carImage = <Widget>[
      Image.asset(
        'assets/car.png',
        width: SizeScaleConfig.screenWidth,
      ),
    ];

    carImage.add(_createMarkingPoint(
        x: car.cModel.mirror.dx, y: car.cModel.mirror.dy, partName: 'Mirror'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.leftMirror.dx,
        y: car.cModel.leftMirror.dy,
        partName: 'Left Side Mirror'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.rightMirror.dx,
        y: car.cModel.rightMirror.dy,
        partName: 'Right Side Mirror'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.leftHeadlights.dx,
        y: car.cModel.leftHeadlights.dy,
        partName: 'Left Head Light'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.rightHeadlights.dx,
        y: car.cModel.rightHeadlights.dy,
        partName: 'Right Head Light'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.bonnet.dx, y: car.cModel.bonnet.dy, partName: 'Bonnet'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.logo.dx, y: car.cModel.logo.dy, partName: 'Car Logo'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.rightGrill.dx,
        y: car.cModel.rightGrill.dy,
        partName: 'Right Grill'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.centerGrill.dx,
        y: car.cModel.centerGrill.dy,
        partName: 'Center Grill'));
    carImage.add(_createMarkingPoint(
        x: car.cModel.leftGrill.dx,
        y: car.cModel.leftGrill.dy,
        partName: 'Left Grill'));
    return carImage;
  }

  _createMarkingPoint({double x, double y, String partName}) {
//    print('x - $x and y - $y');
    return Positioned(
      left: x - sizeScaleConfig.scaleWidth(10),
      top: y - sizeScaleConfig.scaleWidth(10),
      child: InkWell(
        onTap: () {
//          _scaffoldkey.currentState.showSnackBar(SnackBar(
//            content: Text('You clicked ${partName}'),
//            duration: Duration(seconds: 1),
//          ));
        },
        child: Container(
          height: sizeScaleConfig.scaleWidth(20),
          width: sizeScaleConfig.scaleWidth(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
