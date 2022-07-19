import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _selectedDate = prefs.containsKey('ff_selectedDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_selectedDate'))
        : null;
  }

  SharedPreferences prefs;

  DateTime _selectedDate;
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime _value) {
    _selectedDate = _value;
    prefs.setInt('ff_selectedDate', _value.millisecondsSinceEpoch);
  }

  DateTime selectedDateProj;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
