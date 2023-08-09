import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple boleano
final StateProvider<bool> isDarkModeProvider = StateProvider((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple entero
final StateProvider<int> indexColorProvider = StateProvider((ref) => 0);
