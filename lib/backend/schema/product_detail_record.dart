import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductDetailRecord extends FirestoreRecord {
  ProductDetailRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  // "specification" field.
  String? _specification;
  String get specification => _specification ?? '';
  bool hasSpecification() => _specification != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "Order_Ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "modific2" field.
  List<String>? _modific2;
  List<String> get modific2 => _modific2 ?? const [];
  bool hasModific2() => _modific2 != null;

  // "Cart_Ref" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "Product_Ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "modific1" field.
  String? _modific1;
  String get modific1 => _modific1 ?? '';
  bool hasModific1() => _modific1 != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _discription = snapshotData['discription'] as String?;
    _specification = snapshotData['specification'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = snapshotData['quantity'] as int?;
    _orderRef = snapshotData['Order_Ref'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _modific2 = getDataList(snapshotData['modific2']);
    _cartRef = snapshotData['Cart_Ref'] as DocumentReference?;
    _productRef = snapshotData['Product_Ref'] as DocumentReference?;
    _weight = snapshotData['weight'] as int?;
    _modific1 = snapshotData['modific1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product_detail');

  static Stream<ProductDetailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductDetailRecord.fromSnapshot(s));

  static Future<ProductDetailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductDetailRecord.fromSnapshot(s));

  static ProductDetailRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductDetailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductDetailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductDetailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductDetailRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createProductDetailRecordData({
  String? name,
  String? discription,
  String? specification,
  double? price,
  int? quantity,
  DocumentReference? orderRef,
  String? image,
  DocumentReference? cartRef,
  DocumentReference? productRef,
  int? weight,
  String? modific1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'discription': discription,
      'specification': specification,
      'price': price,
      'quantity': quantity,
      'Order_Ref': orderRef,
      'image': image,
      'Cart_Ref': cartRef,
      'Product_Ref': productRef,
      'weight': weight,
      'modific1': modific1,
    }.withoutNulls,
  );

  return firestoreData;
}
