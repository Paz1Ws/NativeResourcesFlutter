import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider<double?>((ref) async* {
  if (await FlutterCompass.events != null) {
    try {
      await for (final event in FlutterCompass.events!) {
        yield event.heading;
      }
    } catch (e) {
      print(e);
    }
  } else {
    throw Exception("Compass not available");
  }
});
