import 'package:delivery_manager/app/modules/phone_form/controllers/phone_form_controller.dart';
import 'package:delivery_manager/app/widgets/keyboard_dismiss_container.dart';
import 'package:delivery_manager/app/widgets/loading_button.dart';
import 'package:delivery_manager/app/widgets/logo_app_bar.dart';
import 'package:delivery_manager/app/widgets/outlined_text_field.dart';
import 'package:delivery_manager/app/widgets/scrollable_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PhoneFormView extends GetView<PhoneFormController> {
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
                  'phone_form_deliverer_sub_header'.tr,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 24),
                Text(
                  'phone_input_hint'.tr,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 16),
                OutlinedTextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  hintText: 'phone_input_label'.tr,
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
                  () => LoadingButton(
                    key: const Key('phone_submit_button'),
                    onPressed: controller.submitForm,
                    child: Text(controller.currentAssets['btn']),
                    isLoading: controller.isLoading.value,
                    isDisabled: !controller.isValid.value,
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
