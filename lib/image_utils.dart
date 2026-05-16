import 'dart:io';
import 'package:image/image.dart' as img;

List<List<List<List<double>>>> preprocessImage(File file) {
  final bytes = file.readAsBytesSync();
  img.Image? image = img.decodeImage(bytes);

  if (image == null) {
    throw Exception("❌ Invalid image");
  }

  const int size = 224; // 🔴 CHANGE if your model uses different size

  final resized = img.copyResize(image, width: size, height: size);

  List<List<List<List<double>>>> input = [
    List.generate(size, (y) {
      return List.generate(size, (x) {
        final pixel = resized.getPixel(x, y);

        return [
          pixel.r / 255.0,
          pixel.g / 255.0,
          pixel.b / 255.0,
        ];
      });
    })
  ];

  return input;
}