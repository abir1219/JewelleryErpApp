import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';

import '../../widgets/app_widgets.dart';

class StateListDialog extends StatefulWidget {
  const StateListDialog({super.key});

  @override
  State<StateListDialog> createState() => _StateListDialogState();
}

class _StateListDialogState extends State<StateListDialog> {
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
                      const Text(
                        "State Search",
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
                      size, "Search State Code,State Name,Country", null,
                      isEnabled: true),
                  Gap(size.height * 0.05),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return _buildStateContainer(index, size);
                      },
                      itemCount: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStateContainer(int index, Size size) {
    return Container(
      height: size.height * 0.065,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      decoration: BoxDecoration(
        color: AppColors.CONTAINER_BACKGROUND_COLOR_01,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.02),
            height: size.height * 0.065,
            width: size.width * 0.15,
            decoration: const BoxDecoration(
                color: AppColors.LOGO_BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  topLeft: Radius.circular(4),
                )
                //BorderRadius.circular(4),
                ),
            child: const Center(
              child: Text(
                "WB",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "West Bengal",
                  style: TextStyle(
                    color: AppColors.LOGO_BACKGROUND_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "INDIA",
                  style: TextStyle(
                    color: AppColors.HINT_TEXT_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: SvgPicture.asset("assets/images/arrow_right_circle.svg"),
          ),
        ],
      ),
    );
  }
}
