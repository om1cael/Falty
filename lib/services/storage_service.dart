import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<bool> saveSetupData(int limit, int days) async {
    double percentageLimit = limit / 100;
    double maxAbsences = percentageLimit * days;
    
    await asyncPrefs.setBool('setup_done', true);
    await asyncPrefs.setInt('max_absences', maxAbsences.toInt());
    await asyncPrefs.setInt('absences', 0);
    return true;
  }

  Future<bool> saveAbsence() async {
    int? absences = await getAbsences();
    if(absences == null) return false;

    await asyncPrefs.setInt('absences', absences + 1);
    return true;
  }

  Future<bool> removeAbsence() async {
    int? absences = await getAbsences();
    if(absences == null || absences == 0) return false;

    await asyncPrefs.setInt('absences', absences - 1);
    return true;
  }

  Future<int?> getAbsences() async {
    return await asyncPrefs.getInt('absences');
  }

  Future<int?> getMaxAbsences() async {
    return await asyncPrefs.getInt('max_absences');
  }

  Future<bool?> getSetupDone() async {
    return await asyncPrefs.getBool('setup_done');
  }
}