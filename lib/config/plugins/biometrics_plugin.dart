import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {

  static final LocalAuthentication auth = LocalAuthentication();


  static availableBiometrics() async {

    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }


  static Future<( bool, String )> authenticate({ bool biometricOnly = false }) async {

      try {

        final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to continue',
            options: AuthenticationOptions(
              biometricOnly: biometricOnly // false podemos colocar el PIN
            )
          );

        return (didAuthenticate, didAuthenticate ? 'Done':'Canceled by user');
        
      } on PlatformException catch (e) {
        print('e');

        if ( e.code == auth_error.notEnrolled ) return ( false, 'No biometrics enrolled');
if ( e.code
 == auth_error.lockedOut ) return ( false, 'Too many attempts');
if ( e.code == auth_error.notAvailable ) return ( false, 'Biometrics not available');
if ( e.code == auth_error.passcodeNotSet ) return ( false, 'Passcode not set');
if ( e.code == auth_error.permanentlyLockedOut ) return ( false, 'Device needs to be unlocked again');


        return (false, e.toString());
      }


  }



}