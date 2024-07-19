import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3784141589.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3013268335.
  MenuItem('Gyroscope', Icons.downloading, '/gyroscope'),
  MenuItem('Accelerometer', Icons.speed, '/accelerometer'),
  MenuItem('Magnetometer', Icons.explore_outlined, '/magnetometer'),
  MenuItem('Gyroscope Ball', Icons.sports_baseball_outlined, '/gyroscope-ball'),
  MenuItem('Compass', Icons.explore, '/compass'),
  MenuItem('Pokemons', Icons.stars, '/pokemons'),
  MenuItem('Background Process', Icons.storage_rounded, '/db-pokemons'),
  MenuItem('Biometrics', Icons.fingerprint, '/biometrics'),
  MenuItem('Ubication', Icons.pin_drop, '/location'),
  MenuItem('Maps', Icons.map_outlined, '/maps'),
  MenuItem('Controlled', Icons.gamepad_outlined, '/controlled-map'),
  MenuItem('Badge', Icons.notification_important, '/badge'),
  MenuItem('Ad Full', Icons.ad_units_rounded, '/ad-fullscreen'),
  MenuItem('Ad Reward', Icons.fort_sharp, '/ad-rewarded'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 1,
      childAspectRatio: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 15,
      children: menuItems
          .map((item) => HomeMenuItem(bgColors: [
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
                Colors.primaries[Random().nextInt(Colors.primaries.length)]
              ], title: item.title, route: item.route, icon: item.icon))
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const HomeMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    required this.bgColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
