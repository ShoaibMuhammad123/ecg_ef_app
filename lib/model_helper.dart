import 'package:tflite_flutter/tflite_flutter.dart';

class ModelHelper {
  Interpreter? _interpreter;

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(
        'assets/model/ecg_ef_model.tflite',
      );
      print("✅ Model Loaded Successfully");
    } catch (e) {
      print("❌ Error loading model: $e");
    }
  }

  Interpreter? get interpreter => _interpreter;
}