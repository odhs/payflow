import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './/modules/barcode_scanner/barcode_scanner_page.dart';
import './/modules/home/home_page.dart';
import './/modules/insert_boleto/insert_boleto.dart';
import './/modules/login/login_page.dart';
import './/modules/splash/splash_page.dart';
import './/shared/models/user_model.dart';
import './/shared/theme/app_colors.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payflow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}
