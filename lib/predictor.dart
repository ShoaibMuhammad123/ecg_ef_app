import 'package:tflite_flutter/tflite_flutter.dart';

double runModel(Interpreter interpreter, dynamic input) {
  try {
    var output = List.generate(1, (_) => [0.0]);

    interpreter.run(input, output);

    return output[0][0];
  } catch (e) {
    print("❌ Prediction error: $e");
    return -1.0;
  }
}
