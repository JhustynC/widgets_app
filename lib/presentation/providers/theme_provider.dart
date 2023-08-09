import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple boleano
final StateProvider<bool> isDarkModeProvider = StateProvider((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple entero
final StateProvider<int> indexColorProvider = StateProvider((ref) => 0);

//EL StateNotifierProvider me permite mantener el estado de cosas mas complejas como clases

//Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeController, AppTheme>(
    (ref) => ThemeController());

//Controller o Notifier, esta clase sera la controle el estado
class ThemeController extends StateNotifier<AppTheme> {
  //El state o estado = new AppTheme();
  ThemeController() : super(AppTheme());

  //tenemos que hacer nuestras implementaciones
  void toggleDarkMode() {
    state = state.copyWith(darkMode: !state.darkMode);
  }

  void changeColorIndex(int indexColor) {
    state = state.copyWith(selectedColor: indexColor);
  }
}
