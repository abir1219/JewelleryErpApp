import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

import '../../utils/app_colors.dart';

class IngredientsFormDialog extends StatefulWidget {
  const IngredientsFormDialog({super.key});

  @override
  State<IngredientsFormDialog> createState() => _IngredientsFormDialogState();
}

class _IngredientsFormDialogState extends State<IngredientsFormDialog> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gap(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Ingredient Details",
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
                Container(
                  // height: size.height * 0.02,
                  width: size.width * 0.3,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * .005,
                      horizontal: size.width * .01),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .002,
                      vertical: size.height * .002),
                  decoration: BoxDecoration(
                    color: AppColors.STEPPER_DONE_COLOR,
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
                      vertical: size.height * .005,
                      horizontal: size.width * .01),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                "GOLD",
                                style: TextStyle(
                                  color: AppColors.LOGO_BACKGROUND_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
                                  child: SvgPicture.asset(
                                    "assets/images/edit.svg",
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.LOGO_BACKGROUND_COLOR,
                                        BlendMode.srcIn),
                                  ),
                                ),
                                Gap(size.width * 0.03),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.white),
                                    child: const Icon(Icons.delete_outline,color: AppColors.LOGO_BACKGROUND_COLOR,size: 28,)
                                    /*SvgPicture.asset(
                                      "assets/images/circle_close.svg",
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.LOGO_BACKGROUND_COLOR,
                                          BlendMode.srcIn),
                                    ),*/
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(size.height * 0.01),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Piece(s)",
                                labelText: 'Piece(s)',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Qty",
                                labelText: 'Qty',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Net",
                                labelText: 'Net',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Rate",
                                labelText: 'Rate',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "C Type",
                                labelText: 'C Type',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Amount",
                                labelText: 'Amount',
                              ),
                            ),
                          ],
                        ),
                        Gap(size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.LOGO_BACKGROUND_COLOR,
                              ),
                            ),
                            const Expanded(child: Divider(
                              color: AppColors.LOGO_BACKGROUND_COLOR,
                              thickness: 1,
                            )),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.LOGO_BACKGROUND_COLOR,
                              ),
                            ),
                          ],
                        ),
                        Gap(size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                "Diamond",
                                style: TextStyle(
                                  color: AppColors.LOGO_BACKGROUND_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
                                  child: SvgPicture.asset(
                                    "assets/images/edit.svg",
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.LOGO_BACKGROUND_COLOR,
                                        BlendMode.srcIn),
                                  ),
                                ),
                                Gap(size.width * 0.03),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle, color: Colors.white),
                                      child: const Icon(Icons.delete_outline,color: AppColors.LOGO_BACKGROUND_COLOR,size: 28,)
                                    /*SvgPicture.asset(
                                      "assets/images/circle_close.svg",
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.LOGO_BACKGROUND_COLOR,
                                          BlendMode.srcIn),
                                    ),*/
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(size.height * 0.01),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Piece(s)",
                                labelText: 'Piece(s)',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Qty",
                                labelText: 'Qty',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Net",
                                labelText: 'Net',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Rate",
                                labelText: 'Rate',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "C Type",
                                labelText: 'C Type',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: null,
                                hintText: "Amount",
                                labelText: 'Amount',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(size.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
