import 'package:delivery_manager/app/controllers/app_controller.dart';
import 'package:delivery_manager/app/data/enums/alert_type.dart';
import 'package:delivery_manager/app/data/repository/deliveries_repository.dart';
import 'package:delivery_manager/app/modules/phone_form/arguments/phone_form_args.dart';
import 'package:delivery_manager/app/modules/phone_form/arguments/phone_form_user.dart';
import 'package:delivery_manager/app/utils/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_manager/app/routes/app_pages.dart';

class DeliveryCodeFormController extends GetxController {
  final AppController appController;
  final DeliveriesRepository deliveriesRepository;

  late GlobalKey<FormState> codeFormKey;
  late TextEditingController codeController;

  final isLoading = false.obs;
  final isValid = false.obs;

  DeliveryCodeFormController({
    required this.appController,
    required this.deliveriesRepository,
    GlobalKey<FormState>? codeFormKey,
  }) : codeFormKey = codeFormKey ?? GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    codeController = TextEditingController();
  }

  @override
  void onClose() {
    codeController.dispose();

    super.onClose();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'empty_delivery_code_input_error'.tr;
    } else if ((value.length != 6) || int.tryParse(value) == null) {
      return 'invalid_delivery_code_input_error'.tr;
    }
    return null;
  }

  void handleFormChange() {
    isValid.value = codeFormKey.currentState!.validate();
  }

  Future<void> submitForm() async {
    // TODO: implement real logic

    isLoading.value = true;
    DismissKeyboard.dismiss(Get.overlayContext!);

    // deliveriesRepository.verifyDelivery('')

    if (!codeFormKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 1));

      Get.toNamed(
        Routes.PHONE_FORM,
        arguments: PhoneFormArgs(user: PhoneFormUser.deliverer),
      );
    } else {
      appController.showAlert(
          text: 'invalid_delivery_code_error'.tr, type: AlertType.error);
    }

    isLoading.value = false;
  }

  void onSupplierPressed() {
    Get.toNamed(
      Routes.PHONE_FORM,
      arguments: PhoneFormArgs(user: PhoneFormUser.supplier),
    );
  }
}
