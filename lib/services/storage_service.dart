import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<bool> saveSetupData(int limit, int days) async {
    double percentageLimit = limit / 100;
    double maxAbsences = percentageLimit * days;
    
    await asyncPrefs.setDouble('max_absences', maxAbsences);
    return true;
  }
}