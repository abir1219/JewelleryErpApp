import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/address_list.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/state_list_dialog.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';
class MobileAddCustomer extends StatefulWidget {
  const MobileAddCustomer({super.key});

  @override
  State<MobileAddCustomer> createState() => _MobileAddCustomerState();
}

class _MobileAddCustomerState extends State<MobileAddCustomer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.STEPPER_DONE_COLOR,
                    ),
                  ),*/
                  const Text("Add Customer",style: TextStyle(color: AppColors.LOGO_BACKGROUND_COLOR,fontWeight: FontWeight.w600,fontSize: 18),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: SvgPicture.asset("assets/images/circle_close.svg",colorFilter: const ColorFilter.mode(AppColors.LOGO_BACKGROUND_COLOR, BlendMode.srcIn),),
                    )
                  ),
                ],
              ),
              Gap(size.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppWidgets.buildField(size, "Customer Name", null),
                      AppWidgets.buildSearchableField(size, "Customer Group", null,),
                      AppWidgets.buildField(size, "Mobile Number", null,textInputType: TextInputType.phone,maxLength: 10,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                      AppWidgets.buildField(size, "Email Id", null),
                      AppWidgets.buildField(size, "Date of Birth", null),
                      AppWidgets.buildField(size, "PAN No", null),
                      AppWidgets.buildField(size, "Marriage Anniversary", null),
                      AppWidgets.buildField(size, "Aadhar Number", null,maxLength: 16,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                      AppWidgets.buildField(size, "Pincode", null,textInputType: TextInputType.phone,maxLength: 6,inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                      AppWidgets.buildSearchableField(size, "Address Id", null,func: () {
                        showGeneralDialog(
                          context: context,
                          // builder: (context) => const IngredientsFormDialog(),
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionBuilder: (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1), // Start from the bottom
                                end: const Offset(0, 0), // End at the center
                              ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut, // Ease-in transformation
                              )),
                              child: child,
                            );
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double>
                              secondaryAnimation) => const AddressList(),
                        );
                      },),
                      AppWidgets.buildSearchableField(size, "Country", null),
                      AppWidgets.buildSearchableField(size, "State", null,func: () {
                        showDialog(context: context, builder: (context) {
                          return const StateListDialog();
                        },);
                      },),
                      AppWidgets.buildField(size, "Credit Limit", null),
                    ],
                  ),
                ),
              ),
              Gap(size.height * .01),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AppWidgets.customButton(
                          size: size,
                          btnName: 'Reset',
                          color: AppColors.HINT_TEXT_COLOR),
                    ),
                    Expanded(
                      child: AppWidgets.customButton(
                          size: size,
                          btnName: 'Cancel',
                          color: AppColors.HINT_TEXT_COLOR),
                    ),
                    Expanded(
                      child: AppWidgets.customButton(
                          size: size,
                          btnName: 'Save',
                          color: AppColors.LOGO_BACKGROUND_COLOR),
                    ),
                  ],
                ),
              ),
              Gap(size.height * 0.02)
            ],
          ),
        ),
      ),
    );
  }
}
