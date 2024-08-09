import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

import '../../utils/app_colors.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Address Information",
                        style: TextStyle(
                          color: AppColors.LOGO_BACKGROUND_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset(
                        "assets/images/circle_close.svg",
                        colorFilter: const ColorFilter.mode(
                            AppColors.LOGO_BACKGROUND_COLOR, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(size.height * 0.02),
              AppWidgets.buildSearchableField(
                  size, "Search address id,state,street,phone,email", null,
                  isEnabled: true,),
              Gap(size.height * 0.05),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _buildCustomerContainer(index, size);
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }

  Widget _buildCustomerContainer(int index, Size size) {
    return Container(
      /*margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.01, vertical: size.height * 0.02),*/
      margin: EdgeInsets.symmetric(vertical: size.height * .005),
      // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
      // padding: const EdgeInsets.only(left: 6), //,vertical: 2
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? AppColors.CONTAINER_BACKGROUND_COLOR_01
            : AppColors.CONTAINER_BACKGROUND_COLOR_02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: size.height * 0.02,
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .005, horizontal: size.width * .01),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .002,
                    vertical: size.height * .002),
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? AppColors.STEPPER_DONE_COLOR
                      : AppColors.CONTAINER_BACKGROUND_COLOR_03,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                  child: Text(
                    "12345678",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .005, horizontal: size.width * .01),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .002,
                    vertical: size.height * .002),
                child: const Text(
                  "Bangalore,Karnataka",
                  style: TextStyle(
                      color: AppColors.STEPPER_DONE_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              /*showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      insetPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.1),
                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                      // backgroundColor: Colors.white,
                      child: const MobileViewCustomer()
                    //const CustomerDetailsDialog(),
                  );
                },
              );*/
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * .005, horizontal: size.width * .02),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .002, vertical: size.height * .002),
              child: const Text(
                "View Details",
                style: TextStyle(
                    color: AppColors.STEPPER_DONE_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
