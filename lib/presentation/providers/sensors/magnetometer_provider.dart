 
 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Magnetometer {
  final double x;

  Magnetometer({required this.x,});

  @override
  String toString() => 'GyroscopeXYZ(x: $x,)';
}

final magnetometerProvider = StreamProvider<Magnetometer>((ref) async* {
  await for (var event in magnetometerEventStream()) {
    final x = double.parse(event.x.toStringAsFixed(2));
    yield Magnetometer(x: x,);
  }
});

 