import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/plugins/quick_Actions.dart';
import 'package:myapp/config/theme/theme.dart';

import 'config/router/router.dart';
import 'presentation/providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  QuickActionsPlugin.registerActions();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    //  ref.read( permissionsProvider.notifier ).checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("State: $state");
    ref.read(appStateProvider.notifier).state = state;
    if (state == AppLifecycleState.resumed) {
      //    ref.read( permissionsProvider.notifier ).checkPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
