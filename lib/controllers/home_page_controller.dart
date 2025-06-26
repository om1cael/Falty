import 'package:falty/services/storage_service.dart';

class HomePageController {
  final StorageService storageService = StorageService();

  Future<bool> saveAbsence() async {
    return await storageService.saveAbsence();
  }

  Future<int?> getMaxAbsences() async {
    return await storageService.getMaxAbsences();
  }

  Future<int?> getAbsences() async {
    return await storageService.getAbsences();
  }
}