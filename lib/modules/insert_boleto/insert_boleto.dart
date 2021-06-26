import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './/modules/insert_boleto/insert_boleto_controller.dart';

import './/shared/theme/app_colors.dart';
import './/shared/theme/app_text_styles.dart';
import './/shared/widgets/input_text/input_text_widget.dart';
import './/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);
  final String? barcode;

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                  child: Text(
                    "Preencha os dados do boleto",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                ),
                InputTextWidget(
                  icon: Icons.description_outlined,
                  label: "Nome do boleto",
                  validator: controller.validateName,
                  onChanged: (value) {
                    controller.onChange(name: value);
                  },
                ),
                InputTextWidget(
                  controller: dueDateInputTextController,
                  icon: FontAwesomeIcons.timesCircle,
                  label: "Vencimento",
                  validator: controller.validateVencimento,
                  onChanged: (value) {
                    controller.onChange(dueDate: value);
                  },
                ),
                InputTextWidget(
                  controller: moneyInputTextController,
                  icon: FontAwesomeIcons.wallet,
                  label: "Valor",
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.onChange(
                        value: moneyInputTextController.numberValue);
                  },
                  validator: (_) => controller
                      .validateValor(moneyInputTextController.numberValue),
                ),
                InputTextWidget(
                  controller: barcodeInputTextController,
                  icon: FontAwesomeIcons.barcode,
                  label: "Código",
                  validator: controller.validateCodigo,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    controller.onChange(barcode: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.of(context).pop();
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto().then((value) => {
                if (value) {Navigator.of(context).pop()}
              });
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
