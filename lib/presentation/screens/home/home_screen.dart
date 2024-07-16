import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/widgets/shared/main_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Miscelaneos'),
            actions: [
              IconButton(
                  onPressed: () {
                    context.push('/permissions');
                  },
                  icon: const Icon(Icons.settings))
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          const MainMenu(),
        ],
      ),
    );
  }
}
