import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

import '../../providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final tittleStyle = Theme.of(context).textTheme.titleLarge;
    final int cont = ref.watch(counterProvider);
    final bool darkMode = ref.watch(isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkMode.notifier).update((state) => !state);
            },
            icon: darkMode
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.mode_night_outlined),
          )
        ],
      ),
      body: Center(
        child: Text(
          '$cont',
          style: const TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Froma 1:
          //ref.read(counterProvider.notifier).state++;

          //Forma 2:
          ref.read(counterProvider.notifier).update((state) => state + 1);

          //Forma 3:
          // ref.read(counterProvider.notifier).update(
          //   (state) {
          //     return state++;
          //   },
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
