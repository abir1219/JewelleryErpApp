import 'package:flutter/material.dart';
import 'package:jewellery_erp_app/screens/estimation/tab_ui/tab_estimation.dart';

import 'mobile_ui/mobile_estimation.dart';

class EstimationScreen extends StatelessWidget {
  const EstimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 600){
            return const MobileEstimation();
          }else{
            return const TabEstimation();
          }
        },),
      ),
    );
  }
}
