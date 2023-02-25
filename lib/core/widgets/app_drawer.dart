import 'package:flutter/material.dart';
import '../../controllers/core/theme_controller.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final readThCon = context.read<ThemeController>();
    final wathThCon = context.watch<ThemeController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 64,
            child: DrawerHeader(
              child: Center(child: Text('Header')),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.brightness_7),
            title: const Text('Brightness'),
            childrenPadding: const EdgeInsets.only(left: 20),
            children: [
              ListTile(
                leading: const Icon(Icons.brightness_7),
                title: const Text('System'),
                onTap: () => readThCon.setThemeMode(ThemeMode.system),
                selected: wathThCon.getThemeMode == ThemeMode.system,
              ),
              ListTile(
                leading: const Icon(Icons.light_mode),
                title: const Text('Light'),
                onTap: () => readThCon.setThemeMode(ThemeMode.light),
                selected: wathThCon.getThemeMode == ThemeMode.light,
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark'),
                onTap: () => readThCon.setThemeMode(ThemeMode.dark),
                selected: wathThCon.getThemeMode == ThemeMode.dark,
              ),
            ],
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
