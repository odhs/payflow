import 'package:flutter/material.dart';

import './/shared/models/boleto_model.dart';
import './/shared/theme/app_colors.dart';
import './/shared/theme/app_text_styles.dart';
import './/shared/widgets/boleto_info/boleto_info_widget.dart';
import './/shared/widgets/boleto_list/boleto_list_controller.dart';
import './/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtracPage extends StatefulWidget {
  const ExtracPage({Key? key}) : super(key: key);

  @override
  _ExtracPageState createState() => _ExtracPageState();
}

class _ExtracPageState extends State<ExtracPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 40,
              color: AppColors.primary,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) =>
                    BoletoInfoWidget(size: boletos.length),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Meus Extratos",
              style: AppTextStyles.titleBoldHeading,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            color: AppColors.stroke,
            height: 0,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletoListWidget(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
