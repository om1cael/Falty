import 'package:falty/services/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupPageController {
  final TextEditingController daysController = TextEditingController();
  final TextEditingController limitController = TextEditingController();

  final StorageService storageService = StorageService();

  bool validate() {
    int? days = int.tryParse(daysController.text);
    int? limit = int.tryParse(limitController.text);

    if(days == null || limit == null) return false;
    if(days < 1 || limit < 1) return false;

    return true;
  }

  /// It would be nice to call validate before (to handle UI etc), but
  /// the save function will check if all fields are valid before saving.
  Future<bool> save() async {
    if(!validate()) return false;

    int days = int.parse(daysController.text);
    int limit = int.parse(limitController.text);

    return await storageService.saveSetupData(limit, days);
  }

  void dispose() {
    daysController.dispose();
    limitController.dispose();
  }
}