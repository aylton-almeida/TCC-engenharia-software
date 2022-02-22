import 'package:delivery_manager/app/widgets/keyboard_dismiss_container.dart';
import 'package:delivery_manager/app/widgets/logo_app_bar.dart';
import 'package:delivery_manager/app/widgets/outlined_text_field.dart';
import 'package:delivery_manager/app/widgets/scrollable_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_input_controller.dart';

class PhoneInputView extends GetView<PhoneInputController> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: FlatAppBar(
          leading: IconButton(
            onPressed: controller.goBack,
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: Image.asset('assets/images/small_logo.png', height: 30),
        ),
        body: ScrollableForm(
          key: controller.phoneFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.currentAssets['title'],
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16),
                Text(
                  'digite seu whatsapp'.tr,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 24),
                Text(
                  'telefone completo'.tr.capitalizeFirst!,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 16),
                OutlinedTextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  hintText: 'telefone'.tr.capitalizeFirst!,
                  validator: controller.validator,
                  onChanged: (_) => controller.handleFormChange(),
                  inputFormatters: [controller.phoneMask],
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => ElevatedButton(
                    key: const Key('phone_submit_button'),
                    onPressed:
                        !controller.isLoading.value && controller.isValid.value
                            ? controller.submitForm
                            : null,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(controller.currentAssets['btn']),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
