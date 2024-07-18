import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/screens/ads/ads_full_screen.dart';
import 'package:myapp/presentation/screens/ads/ads_rewarded_screen.dart';
import 'package:myapp/presentation/screens/badge/badge_screen.dart';
import 'package:myapp/presentation/screens/biometric/digital_sensor.dart';
import 'package:myapp/presentation/screens/location/controlled_map.dart';
import 'package:myapp/presentation/screens/location/maps_screen.dart';
import 'package:myapp/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:myapp/presentation/screens/pokemon/pokemon_view_screen.dart';
import '../../presentation/screens/location/location_screen.dart';
import '../../presentation/screens/screens.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/permissions',
    builder: (context, state) => const PermissionsScreen(),
  ),
  
    //! Sensors
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),

    GoRoute(
      path: '/accelerometer',
       builder: (context, state) => const AccelerometerScreen(),
    ),

    GoRoute(
      path: '/magnetometer',
       builder: (context, state) => const MagnetometerScreen(),
    ),

    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),

    GoRoute(
      path: '/compass',
       builder: (context, state) => const CompassScreen(),
    ),
 GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonView(),
      routes: [

        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id );
          },
        ),
        
      ]
    ),
      GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen(),
    ), GoRoute(
      path: '/location',
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: '/maps',
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: '/controlled-map',
      builder: (context, state) => const ControlledMapScreen(),
    ),
  GoRoute(
      path: '/badge',
      builder: (context, state) => const BadgeScreen(),
    ),
      GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => const AdFullScreen(),
    ),
    
    GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => const AdRewardedScreen(),
    ),

]);
