
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/providers/permissions/permissions_provider.dart';


class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref ) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Required Permission'),
      ),
      body: Center(
        child: FilledButton(
          child: const Text('Location Permission'),
          onPressed: () {

            ref.read( permissionsProvider.notifier )
              .requestLocationAccess();

          },
        ),
      ),
    );
  }
}
