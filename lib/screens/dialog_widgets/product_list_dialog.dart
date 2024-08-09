import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/product_estimate_form_dialog.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';

import '../../widgets/app_widgets.dart';

class ProductListDialog extends StatefulWidget {
  const ProductListDialog({super.key});

  @override
  State<ProductListDialog> createState() => _ProductListDialogState();
}

class _ProductListDialogState extends State<ProductListDialog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.1),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                children: [
                  // Gap(size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product search",
                        style: TextStyle(
                            color: AppColors.LOGO_BACKGROUND_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
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
                                  AppColors.LOGO_BACKGROUND_COLOR,
                                  BlendMode.srcIn),
                            ),
                          )),
                    ],
                  ),
                  Gap(size.height * 0.02),
                  AppWidgets.buildSearchableField(
                      size, "Product code,Name,Id,Qty,Order no..", null,
                      isEnabled: true),
                  Gap(size.height * 0.05),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return _buildProductContainer(index, size,() {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const ProductEstimateFormDialog();
                            },
                          );
                        });
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductContainer(int index, Size size,void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
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
                      "CUS0000001",
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
                    "BRACELET, 18KT, 1Pc.",
                    style: TextStyle(
                        color: AppColors.STEPPER_DONE_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: SvgPicture.asset("assets/images/arrow_right_circle.svg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
