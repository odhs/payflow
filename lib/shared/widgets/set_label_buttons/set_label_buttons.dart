import 'package:flutter/material.dart';

import 'package:payflow/shared/theme/app_colors.dart';
import 'package:payflow/shared/theme/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 0,
            thickness: 1,
            color: AppColors.stroke,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                    style:
                        enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
                DividerVerticalWidget(),
                Expanded(
                  child: LabelButton(
                    label: secondaryLabel,
                    onPressed: secondaryOnPressed,
                    style: enableSecondaryColor
                        ? AppTextStyles.buttonPrimary
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
