import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryProduktRecord extends FirestoreRecord {
  CategoryProduktRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "is_show" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  bool hasIsShow() => _isShow != null;

  // "order_to" field.
  int? _orderTo;
  int get orderTo => _orderTo ?? 0;
  bool hasOrderTo() => _orderTo != null;

  // "product_Id" field.
  DocumentReference? _productId;
  DocumentReference? get productId => _productId;
  bool hasProductId() => _productId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _isShow = snapshotData['is_show'] as bool?;
    _orderTo = snapshotData['order_to'] as int?;
    _productId = snapshotData['product_Id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category_produkt');

  static Stream<CategoryProduktRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryProduktRecord.fromSnapshot(s));

  static Future<CategoryProduktRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryProduktRecord.fromSnapshot(s));

  static CategoryProduktRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryProduktRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryProduktRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryProduktRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryProduktRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCategoryProduktRecordData({
  String? name,
  String? image,
  bool? isShow,
  int? orderTo,
  DocumentReference? productId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'is_show': isShow,
      'order_to': orderTo,
      'product_Id': productId,
    }.withoutNulls,
  );

  return firestoreData;
}
