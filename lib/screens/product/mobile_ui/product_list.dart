import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jewellery_erp_app/screens/dialog_widgets/ingredients_form_dialog.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';

import '../../../widgets/app_widgets.dart';
import '../../dialog_widgets/miscellaneous_product_list.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  double _rotationAngle = 360.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _buildProductContainer(
                    index,
                    size,
                    () {
                      setState(() {
                        debugPrint("kjk==$_rotationAngle");
                        _rotationAngle =
                            _rotationAngle == 180.0 ? 360.0 : 180.0;
                        // _rotationAngle = 360.0;
                      });
                    },
                  ),
                  _rotationAngle == 180.0
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          decoration: const BoxDecoration(
                            color: AppColors.ICON_BACKGROUND_COLOR,
                          ),
                          child: Column(
                            children: [
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
                                      hintText: "Amount",
                                      labelText: 'Amount',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppWidgets.buildSearchableField(
                                      size,
                                      "Ing. Details",
                                      null,
                                      icons: "assets/images/i.svg",
                                      func: () {
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
                                                  secondaryAnimation) => const IngredientsFormDialog(),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.buildSearchableField(
                                        size, "Misc. Charge", null,
                                        icons: "assets/images/search.svg",
                                      func: () {
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
                                              secondaryAnimation) => const MiscellaneousProductList(),
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container()
                ],
              );
            },
            itemCount: 1,
          ),

          /*Column(
            children: [

            ],
          ),*/
        ),
      ),
    );
  }

  Widget _buildProductContainer(int index, Size size, void Function() func) {
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
                      vertical: size.height * .005,
                      horizontal: size.width * .01),
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
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: size.height * .005,
                    horizontal: size.width * .01,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * .002,
                    vertical: size.height * .002,
                  ),
                  child: const Text(
                    "BRACELET, 18KT, 1Pc.",
                    style: TextStyle(
                      color: AppColors.STEPPER_DONE_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: Transform.rotate(
                angle: _rotationAngle * 3.141592653589793 / 180,
                child: SvgPicture.asset(
                  "assets/images/arrow-down-circle.svg",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
