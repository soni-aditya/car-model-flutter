import 'package:car_app/car_model.dart';
import 'package:flutter/material.dart';

class Car {
  double actualImageHeight = 488.0;
  double actualImageWidth = 594.0;

  //
  double relativeImageHeight = 488.0;
  double relativeImageWidth = 594.0;

  //
  double aspectRatio = 1.0;
  double heightRatio = 1.0;
  double widthRatio = 1.0;

  //
  CarModel cModel = CarModel(
    leftGrill: Offset(92, 343),
    leftHeadlights: Offset(92, 230),
    leftMirror: Offset(92, 109),
    bonnet: Offset(298, 154),
    logo: Offset(298, 203),
    mirror: Offset(298, 66),
    centerGrill: Offset(298, 343),
    rightGrill: Offset(501, 343),
    rightHeadlights: Offset(501, 230),
    rightMirror: Offset(501, 109),
  );

  //

  Car() {
    aspectRatio = (actualImageHeight / actualImageWidth);
  }

  calculateRelative({@required double width}) {
    print('HERE');
    relativeImageWidth = width;
    relativeImageHeight = (aspectRatio * relativeImageWidth);
    print(
        'RELATIVE IMAGE HEIGHT - $relativeImageHeight   WIDTH - $relativeImageWidth');
    //
    heightRatio = (relativeImageHeight / actualImageHeight);
    widthRatio = (relativeImageWidth / actualImageWidth);
    //
    cModel.calculateRelative(heightRatio: heightRatio, widthRatio: widthRatio);
    //
  }
}
