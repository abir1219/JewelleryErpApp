import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_erp_app/router/app_pages.dart';
import 'package:jewellery_erp_app/screens/customer/add_customer/add_customer_dialog.dart';
import 'package:jewellery_erp_app/screens/customer/search_customer/search_customer_dialog.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/salesman_list_dialog.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/state_list_dialog.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

class MobileEstimation extends StatelessWidget {
  const MobileEstimation({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final estimateNoController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.PAGE_BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          // shrinkWrap: false,
          // physics: const AlwaysScrollableScrollPhysics(),
          // scrollDirection: Axis.vertical,
          children: [
            AppWidgets().buildTopContainer(size),
            Gap(size.height * .02),
            AppWidgets().buildStepperContainer(size),
            Gap(size.height * .02),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    // width: size.width,
                    margin: EdgeInsets.only(
                      right: size.width * .02,
                      left: size.width * .02,
                      top: size.width * .15,
                    ),
                    padding: EdgeInsets.only(
                        right: 10, left: 10, top: size.height * .09), //75
                    // margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Gap( 75),
                          AppWidgets.buildField(
                              size, "Estimate No", estimateNoController),
                          AppWidgets.buildField(
                              size, "Customer Name", estimateNoController),
                          AppWidgets.buildField(
                              size, "Customer Id", estimateNoController),
                          AppWidgets.buildField(
                              size, "Address", estimateNoController),
                          AppWidgets.buildField(
                              size, "Narration", estimateNoController),
                          AppWidgets.buildField(
                              size, "PAN", estimateNoController),
                          AppWidgets.buildSearchableField(
                            size,
                            "POS",
                            estimateNoController,
                            func: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const StateListDialog();
                                },
                              );
                            },
                          ),
                          AppWidgets.buildSearchableField(
                            size,
                            "Sales Person",
                            estimateNoController,
                            func: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const SalesmanListDialog();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // bottom: 0, // Provide bottom padding for Row
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCustomerTab(
                            size, "plus_circle.svg", "New Customer", () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const AddCustomerDialog();
                            },
                          );
                        } //context.go(AppPages.ADD_CUSTOMER),
                            ),
                        _buildCustomerTab(
                          size,
                          "search.svg",
                          "Search Customer",
                          () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return const SearchCustomerDialog();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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
                        btnName: 'Add',
                        color: AppColors.LOGO_BACKGROUND_COLOR),
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
                      btnName: 'Next',
                      color: AppColors.LOGO_BACKGROUND_COLOR,
                      func: () => context.go(
                        AppPages.SEARCH_PRODUCT,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(size.height * 0.02)
          ],
        ),
      ),
    );
  }

  

  Widget _buildCustomerTab(
      Size size, String icon, String title, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: size.height * .15,
        //100,
        width: size.width * .35,
        //100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0.5, 0.5),
                blurRadius: 1.2,
                spreadRadius: 0.5,
              ),
            ]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * .08, //100,
                width: size.width * .2, //100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.ICON_BACKGROUND_COLOR,
                ),
                child: Center(
                  child: SvgPicture.asset("assets/images/$icon"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * .02),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.LOGO_BACKGROUND_COLOR,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
