import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_erp_app/router/app_routers.dart';

import 'debug/bloc_observer.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // key: navigatorKey,
      // routeInformationParser: AppRouters().routers.routeInformationParser,
      title: 'Jewellery Application',
      routerConfig: AppRouters().routers,
      // routerDelegate: AppRouters().routers.routerDelegate,
      theme: ThemeData(
        fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
