import 'package:flutter/widgets.dart';

class SetupPageController {
  final TextEditingController daysController = TextEditingController();
  final TextEditingController limitController = TextEditingController();

  bool validate() {
    int? days = int.tryParse(daysController.text);
    int? limit = int.tryParse(limitController.text);

    if(days == null || limit == null) return false;
    if(days < 1 || limit < 1) return false;

    return true;
  }

  bool save() {
    return false;
  }

  void dispose() {
    daysController.dispose();
    limitController.dispose();
  }
}