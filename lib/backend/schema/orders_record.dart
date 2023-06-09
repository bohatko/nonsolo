import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "order_number" field.
  int? _orderNumber;
  int get orderNumber => _orderNumber ?? 0;
  bool hasOrderNumber() => _orderNumber != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "Number_of_goods" field.
  int? _numberOfGoods;
  int get numberOfGoods => _numberOfGoods ?? 0;
  bool hasNumberOfGoods() => _numberOfGoods != null;

  // "Payment_Methods" field.
  String? _paymentMethods;
  String get paymentMethods => _paymentMethods ?? '';
  bool hasPaymentMethods() => _paymentMethods != null;

  // "Delivery_Address" field.
  String? _deliveryAddress;
  String get deliveryAddress => _deliveryAddress ?? '';
  bool hasDeliveryAddress() => _deliveryAddress != null;

  // "contact_Name" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "Phone_Number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Delivery_price" field.
  double? _deliveryPrice;
  double get deliveryPrice => _deliveryPrice ?? 0.0;
  bool hasDeliveryPrice() => _deliveryPrice != null;

  // "Delivery_Method" field.
  String? _deliveryMethod;
  String get deliveryMethod => _deliveryMethod ?? '';
  bool hasDeliveryMethod() => _deliveryMethod != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "specific" field.
  List<String>? _specific;
  List<String> get specific => _specific ?? const [];
  bool hasSpecific() => _specific != null;

  // "specific1" field.
  List<String>? _specific1;
  List<String> get specific1 => _specific1 ?? const [];
  bool hasSpecific1() => _specific1 != null;

  // "User_Ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "Product_List" field.
  List<DocumentReference>? _productList;
  List<DocumentReference> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _orderNumber = snapshotData['order_number'] as int?;
    _total = castToType<double>(snapshotData['total']);
    _orderStatus = snapshotData['order_status'] as String?;
    _numberOfGoods = snapshotData['Number_of_goods'] as int?;
    _paymentMethods = snapshotData['Payment_Methods'] as String?;
    _deliveryAddress = snapshotData['Delivery_Address'] as String?;
    _contactName = snapshotData['contact_Name'] as String?;
    _phoneNumber = snapshotData['Phone_Number'] as String?;
    _deliveryPrice = castToType<double>(snapshotData['Delivery_price']);
    _deliveryMethod = snapshotData['Delivery_Method'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _specific = getDataList(snapshotData['specific']);
    _specific1 = getDataList(snapshotData['specific1']);
    _userRef = snapshotData['User_Ref'] as DocumentReference?;
    _productList = getDataList(snapshotData['Product_List']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? createdAt,
  int? orderNumber,
  double? total,
  String? orderStatus,
  int? numberOfGoods,
  String? paymentMethods,
  String? deliveryAddress,
  String? contactName,
  String? phoneNumber,
  double? deliveryPrice,
  String? deliveryMethod,
  double? subtotal,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'order_number': orderNumber,
      'total': total,
      'order_status': orderStatus,
      'Number_of_goods': numberOfGoods,
      'Payment_Methods': paymentMethods,
      'Delivery_Address': deliveryAddress,
      'contact_Name': contactName,
      'Phone_Number': phoneNumber,
      'Delivery_price': deliveryPrice,
      'Delivery_Method': deliveryMethod,
      'subtotal': subtotal,
      'User_Ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
