import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/scans_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final primary = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider()),
        ChangeNotifierProvider(
          create: (context) => ScanListProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR RIDE',
          initialRoute: 'home',
          routes: {
            'home': (context) => const HomePage(),
            'mapa': (context) => const MapaPage()
          },
          theme: ThemeData(
              primaryColor: primary,
              iconTheme: IconThemeData(color: primary),
              bottomNavigationBarTheme:
                  BottomNavigationBarThemeData(selectedItemColor: primary),
              appBarTheme: AppBarTheme(backgroundColor: primary),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: primary))),
    );
  }
}
