import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool darkMode = ref.watch(themeNotifierProvider).darkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: darkMode
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.mode_night_outlined),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final colorList = ref.watch(colorListProvider);
    //final indexColor = ref.watch(indexColorProvider);
    final indexColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (BuildContext context, int index) {
        final color = colorList[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: indexColor,
          onChanged: (value) {
            //ref.read(indexColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
