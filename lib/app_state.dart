import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((path) => path.ref)
              .toList() ??
          _cart;
    });
    await _safeInitAsync(() async {
      _CartSum = await secureStorage.getDouble('ff_CartSum') ?? _CartSum;
    });
    await _safeInitAsync(() async {
      _CountCart = await secureStorage.getInt('ff_CountCart') ?? _CountCart;
    });
    await _safeInitAsync(() async {
      _DelveryIS = await secureStorage.getString('ff_DelveryIS') ?? _DelveryIS;
    });
    await _safeInitAsync(() async {
      _PaymentIs = await secureStorage.getString('ff_PaymentIs') ?? _PaymentIs;
    });
    await _safeInitAsync(() async {
      _DeliveryPrice =
          await secureStorage.getDouble('ff_DeliveryPrice') ?? _DeliveryPrice;
    });
    await _safeInitAsync(() async {
      _isCategory =
          await secureStorage.getString('ff_isCategory') ?? _isCategory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
    secureStorage.setStringList('ff_cart', _value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  double _CartSum = 0;
  double get CartSum => _CartSum;
  set CartSum(double _value) {
    _CartSum = _value;
    secureStorage.setDouble('ff_CartSum', _value);
  }

  void deleteCartSum() {
    secureStorage.delete(key: 'ff_CartSum');
  }

  int _CountCart = 0;
  int get CountCart => _CountCart;
  set CountCart(int _value) {
    _CountCart = _value;
    secureStorage.setInt('ff_CountCart', _value);
  }

  void deleteCountCart() {
    secureStorage.delete(key: 'ff_CountCart');
  }

  String _DelveryIS = '';
  String get DelveryIS => _DelveryIS;
  set DelveryIS(String _value) {
    _DelveryIS = _value;
    secureStorage.setString('ff_DelveryIS', _value);
  }

  void deleteDelveryIS() {
    secureStorage.delete(key: 'ff_DelveryIS');
  }

  String _PaymentIs = '';
  String get PaymentIs => _PaymentIs;
  set PaymentIs(String _value) {
    _PaymentIs = _value;
    secureStorage.setString('ff_PaymentIs', _value);
  }

  void deletePaymentIs() {
    secureStorage.delete(key: 'ff_PaymentIs');
  }

  double _DeliveryPrice = 0.0;
  double get DeliveryPrice => _DeliveryPrice;
  set DeliveryPrice(double _value) {
    _DeliveryPrice = _value;
    secureStorage.setDouble('ff_DeliveryPrice', _value);
  }

  void deleteDeliveryPrice() {
    secureStorage.delete(key: 'ff_DeliveryPrice');
  }

  String _isCategory = '';
  String get isCategory => _isCategory;
  set isCategory(String _value) {
    _isCategory = _value;
    secureStorage.setString('ff_isCategory', _value);
  }

  void deleteIsCategory() {
    secureStorage.delete(key: 'ff_isCategory');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
