import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Para ver si tiene notch verficamos la distancia desde el top
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = MenuItem.appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          //En caso de tener notch, vajamos todo un poco mas o menos
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text('Main'),
        ),
        ...MenuItem.appMenuItems.sublist(0, 3).map(
              (menuitem) => NavigationDrawerDestination(
                icon: Icon(menuitem.icon),
                label: Text(menuitem.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),
        const Padding(
          //En caso de tener notch, vajamos todo un poco mas o menos
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Secondary Options'),
        ),
        ...MenuItem.appMenuItems.sublist(3).map(
              (menuitem) => NavigationDrawerDestination(
                icon: Icon(menuitem.icon),
                label: Text(menuitem.title),
              ),
            ),
      ],
    );
  }
}
