import 'package:flutter/cupertino.dart';

class CarModel {
  //
  Offset leftMirror = Offset(0, 0);
  Offset rightMirror = Offset(0, 0);
  Offset leftHeadlights = Offset(0, 0);
  Offset rightHeadlights = Offset(0, 0);

  //
  Offset leftGrill = Offset(0, 0);
  Offset rightGrill = Offset(0, 0);
  Offset centerGrill = Offset(0, 0);

  //
  Offset logo = Offset(0, 0);
  Offset mirror = Offset(0, 0);
  Offset bonnet = Offset(0, 0);

  //
  CarModel({
    this.bonnet,
    this.centerGrill,
    this.leftGrill,
    this.leftHeadlights,
    this.leftMirror,
    this.logo,
    this.mirror,
    this.rightGrill,
    this.rightHeadlights,
    this.rightMirror,
  });

  /*
    height ratio => relative height / actual height
    width ratio => relative width / actual width
   */
  calculateRelative(
      {double heightRatio,
      double widthRatio,
      double aspectRatio,
      double heightOffset = 0.0}) {
    //
    leftMirror = leftMirror?.scale(widthRatio, heightRatio) ?? null;
    //
    rightMirror = rightMirror?.scale(widthRatio, heightRatio) ?? null;
    //
    leftHeadlights = leftHeadlights?.scale(widthRatio, heightRatio) ?? null;

    //
    rightHeadlights = rightHeadlights?.scale(widthRatio, heightRatio) ?? null;

    //
    leftGrill = leftGrill?.scale(widthRatio, heightRatio) ?? null;

    //
    rightGrill = rightGrill?.scale(widthRatio, heightRatio) ?? null;

    //
    centerGrill = centerGrill?.scale(widthRatio, heightRatio) ?? null;

    //
    logo = logo?.scale(widthRatio, heightRatio) ?? null;

    //
    mirror = mirror?.scale(widthRatio, heightRatio) ?? null;

    //
    bonnet = bonnet?.scale(widthRatio, heightRatio) ?? null;

    //
  }
}
