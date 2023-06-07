import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountOrderRecord extends FirestoreRecord {
  CountOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _number = snapshotData['number'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('count_order');

  static Stream<CountOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountOrderRecord.fromSnapshot(s));

  static Future<CountOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountOrderRecord.fromSnapshot(s));

  static CountOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountOrderRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCountOrderRecordData({
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}
