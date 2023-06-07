import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cart_is_empty/cart_is_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/category_more/category_more_widget.dart';
import '/pages/delivery_method/delivery_method_widget.dart';
import '/pages/order_complited/order_complited_widget.dart';
import '/pages/payment_method/payment_method_widget.dart';
import '/pages/produkt_more_copy/produkt_more_copy_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  CountOrderRecord? orderNumber;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
