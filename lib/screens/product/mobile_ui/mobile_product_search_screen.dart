import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_erp_app/router/app_pages.dart';
import 'package:jewellery_erp_app/screens/product/mobile_ui/product_list.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

import '../../../utils/app_colors.dart';
import '../../dialog_widgets/product_list_dialog.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        context.go(AppPages.ESTIMATION);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppWidgets().buildTopContainer(size),
              Gap(size.height * .02),
              AppWidgets().buildStepperContainer(size, pageNo: 2),
              Gap(size.height * .02),
              const Expanded(
                child: ProductList()
                /*Center(
                  child: Text(
                    "No Product Found",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),*/
              ),
              Gap(size.height * .01),
              Container(
                height: size.height * .06,
                color: AppColors.LOGO_BACKGROUND_COLOR,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Estimate Amount",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Icon(
                              Icons.info,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text("₹ 34080.22",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))
                      ],
                    ),),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: AppWidgets.customButton(
                          size: size,
                          btnName: "Submit",
                          color: Colors.white,
                          textColor: AppColors.LOGO_BACKGROUND_COLOR,
                        ),
                      ),
                    ),
                    // Gap(size.width * 0.01),
                  ],
                ),
              ),
              Gap(size.height * .01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.height * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AppWidgets.customButton(
                        size: size,
                        btnName: 'Cancel',
                        color: AppColors.LOGO_BACKGROUND_COLOR,
                        func: () => context.go(
                          AppPages.ESTIMATION,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppWidgets.customButton(
                          size: size,
                          btnName: 'Reset',
                          color: AppColors.LOGO_BACKGROUND_COLOR),
                    ),
                    Expanded(
                      child: AppWidgets.customButton(
                          size: size,
                          btnName: 'Add Product',
                          color: AppColors.LOGO_BACKGROUND_COLOR,
                          func: () {
                            showDialog(
                              builder: (context) {
                                return const ProductListDialog();
                              },
                              context: context,
                            );
                          }),
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
