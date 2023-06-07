import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalesRecord extends FirestoreRecord {
  SalesRecord._(
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

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "is_Ended" field.
  bool? _isEnded;
  bool get isEnded => _isEnded ?? false;
  bool hasIsEnded() => _isEnded != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _isEnded = snapshotData['is_Ended'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sales');

  static Stream<SalesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SalesRecord.fromSnapshot(s));

  static Future<SalesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SalesRecord.fromSnapshot(s));

  static SalesRecord fromSnapshot(DocumentSnapshot snapshot) => SalesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSalesRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? isEnded,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'is_Ended': isEnded,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}
