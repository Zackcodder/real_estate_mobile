import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_mobile/providers/map_provider.dart';
import 'package:real_estate_mobile/providers/nav_bar_provider.dart';
import 'package:real_estate_mobile/widgets/navBar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapViewProvider()),
        ChangeNotifierProvider(create: (context) => NavbarProvider()),
      ],
      child: MaterialApp(
        title: 'Real Estate App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: MyApp.navigatorKey,
        home: const NarBar(),
        // routes: {
        //   '/search': (context) => const SearchScreen(),
        //   '/details': (context) => const PropertiesScreen(),
        // },
      ),
    );
  }
}
