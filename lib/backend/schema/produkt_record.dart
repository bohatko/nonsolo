import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProduktRecord extends FirestoreRecord {
  ProduktRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "category_ID" field.
  DocumentReference? _categoryID;
  DocumentReference? get categoryID => _categoryID;
  bool hasCategoryID() => _categoryID != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  // "specification" field.
  List<String>? _specification;
  List<String> get specification => _specification ?? const [];
  bool hasSpecification() => _specification != null;

  // "specification2" field.
  List<String>? _specification2;
  List<String> get specification2 => _specification2 ?? const [];
  bool hasSpecification2() => _specification2 != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "Category_Name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _onSale = snapshotData['on_sale'] as bool?;
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _image = snapshotData['image'] as String?;
    _categoryID = snapshotData['category_ID'] as DocumentReference?;
    _type = getDataList(snapshotData['type']);
    _specification = getDataList(snapshotData['specification']);
    _specification2 = getDataList(snapshotData['specification2']);
    _weight = snapshotData['weight'] as int?;
    _categoryName = snapshotData['Category_Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produkt');

  static Stream<ProduktRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduktRecord.fromSnapshot(s));

  static Future<ProduktRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduktRecord.fromSnapshot(s));

  static ProduktRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduktRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduktRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduktRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProduktRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createProduktRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  bool? onSale,
  double? salePrice,
  String? image,
  DocumentReference? categoryID,
  int? weight,
  String? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'created_at': createdAt,
      'on_sale': onSale,
      'sale_price': salePrice,
      'image': image,
      'category_ID': categoryID,
      'weight': weight,
      'Category_Name': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}
