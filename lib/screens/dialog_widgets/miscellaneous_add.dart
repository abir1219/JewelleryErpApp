import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

class MiscellaneousAdd extends StatefulWidget {
  const MiscellaneousAdd({super.key});

  @override
  State<MiscellaneousAdd> createState() => _MiscellaneousAddState();
}

class _MiscellaneousAddState extends State<MiscellaneousAdd> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.025,
        vertical: size.height * 0.25,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          children: [
            Gap(size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      "Miscellaneous Charges",
                      style: TextStyle(
                          color: AppColors.LOGO_BACKGROUND_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
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
                            AppColors.LOGO_BACKGROUND_COLOR,
                            BlendMode.srcIn),
                      ),
                    )),
              ],
            ),
            Gap(size.height * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    AppWidgets().buildTextFormField(size, controller: null, hintText: "Misc. charge code", labelText: "Code"),
                    AppWidgets().buildTextFormField(size, controller: null, hintText: "Misc. charge to", labelText: "To"),
                    AppWidgets().buildTextFormField(size, controller: null, hintText: "0", labelText: "Rate"),
                  ],
                ),
              ),
            ),
            Gap(size.height * 0.005),
            Center(
              child: AppWidgets.customButton(
                  size: size,
                  btnName: "Submit",
                  color: AppColors.LOGO_BACKGROUND_COLOR),
            ),
            Gap(size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
