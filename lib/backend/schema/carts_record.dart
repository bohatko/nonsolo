import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_Ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "product_Count" field.
  int? _productCount;
  int get productCount => _productCount ?? 0;
  bool hasProductCount() => _productCount != null;

  // "cart_Active" field.
  bool? _cartActive;
  bool get cartActive => _cartActive ?? false;
  bool hasCartActive() => _cartActive != null;

  // "cart_Sum" field.
  double? _cartSum;
  double get cartSum => _cartSum ?? 0.0;
  bool hasCartSum() => _cartSum != null;

  // "Product_Detail_Ref" field.
  List<DocumentReference>? _productDetailRef;
  List<DocumentReference> get productDetailRef => _productDetailRef ?? const [];
  bool hasProductDetailRef() => _productDetailRef != null;

  void _initializeFields() {
    _userRef = snapshotData['user_Ref'] as DocumentReference?;
    _productCount = snapshotData['product_Count'] as int?;
    _cartActive = snapshotData['cart_Active'] as bool?;
    _cartSum = castToType<double>(snapshotData['cart_Sum']);
    _productDetailRef = getDataList(snapshotData['Product_Detail_Ref']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? userRef,
  int? productCount,
  bool? cartActive,
  double? cartSum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_Ref': userRef,
      'product_Count': productCount,
      'cart_Active': cartActive,
      'cart_Sum': cartSum,
    }.withoutNulls,
  );

  return firestoreData;
}
