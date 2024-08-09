import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_erp_app/router/app_pages.dart';
import 'package:jewellery_erp_app/screens/customer/add_customer/add_customer_dialog.dart';
import 'package:jewellery_erp_app/screens/customer/view_customer/view_customer.dart';
import 'package:jewellery_erp_app/screens/estimation/estimation_screen.dart';

import '../screens/product/mobile_ui/mobile_product_search_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/url_verification_screen.dart';

class AppRouters {
  GoRouter routers =
      GoRouter(/*initialLocation: AppPages.SPLASH_SCREEN, */routes: [
    GoRoute(
      path: AppPages.SPLASH_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        // child: SplashScreen(),
        child: UrlVerificationScreen(),
      ),
      // builder: (BuildContext context, GoRouterState state) =>
      //     const SplashScreen(),
    ),
    GoRoute(
      path: AppPages.ESTIMATION,
      pageBuilder: (context, state) => const MaterialPage(
        child: EstimationScreen(),
      ),
      // builder: (BuildContext context, GoRouterState state) =>
      //     const EstimationScreen(),
    ),
    GoRoute(
      path: AppPages.ADD_CUSTOMER,
      pageBuilder: (context, state) => const MaterialPage(
        child: AddCustomerDialog(),
      ),
      // builder: (BuildContext context, GoRouterState state) =>
      //     const AddCustomerDialog(),
    ),
        GoRoute(
          path: AppPages.VIEW_CUSTOMER,
          pageBuilder: (context, state) => const MaterialPage(
            child: ViewCustomer(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        GoRoute(
          path: AppPages.SEARCH_PRODUCT,
          pageBuilder: (context, state) => const MaterialPage(
            child: ProductSearchScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),
        /*GoRoute(
          path: AppPages.PRODUCT_LIST,
          pageBuilder: (context, state) => const MaterialPage(
            child: MobileProductListScreen(),
          ),
          // builder: (BuildContext context, GoRouterState state) =>
          //     const AddCustomerDialog(),
        ),*/
  ]);
}
