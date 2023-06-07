// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteProductDetailByName(String productName) async {
  final productDetailCollection =
      FirebaseFirestore.instance.collection('Product_detail');
  final querySnapshot =
      await productDetailCollection.where('name', isEqualTo: productName).get();

  querySnapshot.docs.forEach((doc) {
    doc.reference.delete();
  });
}
