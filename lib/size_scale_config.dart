/*
Base height and weight is as per the viewport size given in the designs
Hence baseHeight and baseWidth are constant throughout the app
Viewport designs are as per Iphone 7plus
ie. height = 736.0 and width = 414.0
 */
class SizeScaleConfig {
  final double baseHeight = 736.0;
  final double baseWidth = 414.0;

  static double screenHeight;
  static double screenWidth;
  static double heightScaleRatio;
  static double widthScaleRatio;
  static double scaleFactor;

  void calculateScaleRatios() {
    heightScaleRatio = screenHeight / baseHeight;
    widthScaleRatio = screenWidth / baseWidth;
  }

  double scaleHeight(double actualHeight) {
    return actualHeight * heightScaleRatio * scaleFactor;
  }

  double scaleWidth(double actualWidth) {
    return actualWidth * widthScaleRatio * scaleFactor;
  }
}