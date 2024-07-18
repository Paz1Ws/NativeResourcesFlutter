import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/providers/ads/adsmob_providers.dart';


class AdFullScreen extends ConsumerWidget {
  
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final interstitialAdAsync = ref.watch( adInterstitialProvider );

    ref.listen(adInterstitialProvider, (previous, next) {
      if ( !next.hasValue ) return;
      if( next.value == null ) return;

      next.value!.show();
    });
    

    if ( interstitialAdAsync.isLoading ) {
      return const Scaffold(
        body: Center( child: Text('Cargando ad'), ),
      );
    }



    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),
      body: const Center(
        child: Text('Now you can return to see another page.'),
      ),
    );
  }
}