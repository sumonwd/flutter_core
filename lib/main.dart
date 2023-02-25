import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import './core/widgets/app_drawer.dart';
import './controllers/core/theme_controller.dart';
import './core/core_themes.dart';
import './core/utils.dart';
import 'package:provider/provider.dart';

bool shouldUseFirebaseEmulator = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // localiZation
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'DO')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeController()),
        ],
        builder: (context, child) => MaterialApp(
          navigatorKey: Utils.navigatorKey,
          scaffoldMessengerKey: Utils.messengerKey,
          title: 'Flutter Core',
          themeMode: context.watch<ThemeController>().getThemeMode,
          theme: CoreThemes.lightTheme,
          darkTheme: CoreThemes.darkTheme,
          home: const MyHomePage(title: 'Flutter Core'),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<ThemeController>().setAutoThemeMode();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
