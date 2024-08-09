import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

import '../../utils/app_colors.dart';

class ProductEstimateFormDialog extends StatefulWidget {
  const ProductEstimateFormDialog({super.key});

  @override
  State<ProductEstimateFormDialog> createState() =>
      _ProductEstimateFormDialogState();
}

class _ProductEstimateFormDialogState extends State<ProductEstimateFormDialog> {
  TextEditingController productIdController = TextEditingController();
  TextEditingController pieceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController netController = TextEditingController();
  TextEditingController marketRateController = TextEditingController();
  TextEditingController marketTypeController = TextEditingController();
  TextEditingController marketValueController = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Bracelet 18K",
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppWidgets().buildTextFormField(
                          size,
                          controller: productIdController,
                          hintText: "Product",
                          labelText: 'Product',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: pieceController,
                                hintText: "Piece",
                                labelText: 'Piece',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: quantityController,
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
                                controller: netController,
                                hintText: "Net",
                                labelText: 'Net',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: marketRateController,
                                hintText: "Mkt Rate",
                                labelText: 'Mkt Rate',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: pieceController,
                                hintText: "Mkt Type",
                                labelText: 'Mkt Type',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: quantityController,
                                hintText: "Mkt Val",
                                labelText: 'Mkt Val',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: netController,
                                hintText: "St. Val",
                                labelText: 'St. Val',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: marketRateController,
                                hintText: "Dia. Val.",
                                labelText: 'Dia. Val.',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: pieceController,
                                hintText: "Other Val.",
                                labelText: 'Other Val.',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: quantityController,
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
                                controller: netController,
                                hintText: "CType",
                                labelText: 'CType',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: marketRateController,
                                hintText: "C Value",
                                labelText: 'C Value',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: pieceController,
                                hintText: "Disc Per",
                                labelText: 'Disc Per',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: quantityController,
                                hintText: "Disc Amt",
                                labelText: 'Disc Amt',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: netController,
                                hintText: "Misc Amt",
                                labelText: 'Misc Amt',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: marketRateController,
                                hintText: "Tax Code",
                                labelText: 'Tax Code',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: pieceController,
                                hintText: "Tax Amt",
                                labelText: 'Tax Amt',
                              ),
                            ),
                            Expanded(
                              child: AppWidgets().buildTextFormField(
                                size,
                                controller: quantityController,
                                hintText: "Line Amt",
                                labelText: 'Line Amt',
                              ),
                            ),
                          ],
                        ),
                        AppWidgets().buildTextFormField(
                          size,
                          controller: productIdController,
                          hintText: "Estimate Amt",
                          labelText: 'Estimate Amt',
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(size.height * 0.01),
                AppWidgets.customButton(
                  size: size,
                  btnName: "Submit",
                  color: AppColors.LOGO_BACKGROUND_COLOR,
                  func: () {},
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
