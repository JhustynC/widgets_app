import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { none, car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTrans = Transportation.none;
  bool wantsBreakfast = false;
  bool wantsLuch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehiculo de trnasporte'),
          subtitle: Text('$selectedTrans'),
          children: [
            RadioListTile(
              title: const Text('None'),
              value: Transportation.none,
              groupValue: selectedTrans,
              onChanged: (value) => setState(() {
                selectedTrans = Transportation.none;
              }),
            ),
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar con carro'),
              value: Transportation.car,
              groupValue: selectedTrans,
              onChanged: (value) => setState(() {
                selectedTrans = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar con bote'),
              value: Transportation.boat,
              groupValue: selectedTrans,
              onChanged: (value) => setState(() {
                selectedTrans = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar con avion'),
              value: Transportation.plane,
              groupValue: selectedTrans,
              onChanged: (value) => setState(() {
                selectedTrans = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar con submarino'),
              value: Transportation.submarine,
              groupValue: selectedTrans,
              onChanged: (value) => setState(() {
                selectedTrans = Transportation.submarine;
              }),
            ),
          ],
        ),
        //todo: por aqui

        CheckboxListTile(
          title: const Text('Incluir desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir almuezo?'),
          value: wantsLuch,
          onChanged: (value) => setState(() {
            wantsLuch = !wantsLuch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
