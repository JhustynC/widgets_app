import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });

  static List<MenuItem> appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Buttons',
      subTitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined,
    ),
    MenuItem(
      title: 'Cards',
      subTitle: 'Un contenerdor estilizado',
      link: '/cards',
      icon: Icons.credit_card,
    ),
    MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y Controlados',
      link: '/progress',
      icon: Icons.refresh_rounded,
    ),
    MenuItem(
      title: 'Snackbar y Dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_outline,
    ),
    MenuItem(
      title: 'Animated Container',
      subTitle: 'Statefull widget animado random',
      link: '/animated',
      icon: Icons.check_box_outline_blank,
    ),
    MenuItem(
        title: 'UI Controllers',
        subTitle: 'Una serie de controles de flutter',
        link: '/ui_controls',
        icon: Icons.control_camera),
    MenuItem(
      title: 'App Tutorial',
      subTitle: 'Introduccion para la aplicacion',
      link: '/app_tutorial',
      icon: Icons.hdr_weak_outlined,
    ),
    MenuItem(
      title: 'Infinite scroll and Pull',
      subTitle: 'Listas infinintas y pull to refresh',
      link: '/infinite',
      icon: Icons.format_list_numbered_rtl_sharp,
    ),
  ];
}
