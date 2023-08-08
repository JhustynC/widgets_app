import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    //para eliminar los sanckbars anteriores y no se vea feo
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      useSafeArea: true,
      //barrierColor: Colors.amber[20],
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Custom Dialog'),
          content: const Text(
              'Excepteur reprehenderit irure enim fugiat. Magna Lorem cillum nostrud tempor fugiat excepteur laborum laboris non in amet eiusmod sunt deserunt. Ipsum nulla do occaecat eiusmod commodo. Officia aute aliqua deserunt ex.'),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text('Cancelar')),
            FilledButton(
                onPressed: () => context.pop(), child: const Text('Aceptar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => openDialog(context),
              child: const Text('Licencias Usadas'),
            ),
            FilledButton(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Proident id mollit pariatur officia magna occaecat occaecat. Deserunt laborum excepteur dolore pariatur esse in sunt quis. Sint reprehenderit mollit aute duis veniam nostrud occaecat consequat exercitation tempor fugiat fugiat non enim. Sunt dolor quis laborum irure reprehenderit. In elit est nisi tempor et irure nulla magna exercitation esse.')
                ]);
              },
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),
    );
  }
}
