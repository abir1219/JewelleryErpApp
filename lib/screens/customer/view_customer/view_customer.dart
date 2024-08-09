import 'package:flutter/material.dart';
import 'package:jewellery_erp_app/screens/customer/view_customer/tab_ui/tab_view_customer.dart';

import 'mobile_ui/mobile_view_customer.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({super.key});

  @override
  State<ViewCustomer> createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.1),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 600){
            return const MobileViewCustomer();
          }else{
            return const TabViewCustomer();
          }
        },),
      ),
    );
  }
}
