import 'package:flutter/material.dart';
import 'package:jewellery_erp_app/screens/customer/add_customer/mobile_ui/mobile_add_customer.dart';
import 'package:jewellery_erp_app/screens/customer/add_customer/tab_ui/tab_add_customer.dart';

class AddCustomerDialog extends StatefulWidget {
  const AddCustomerDialog({super.key});

  @override
  State<AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<AddCustomerDialog> {
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
            return const MobileAddCustomer();
          }else{
            return const TabAddCustomer();
          }
        },),
      ),
    );
  }
}
