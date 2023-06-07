import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class CreateProductModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for clonableURL widget.
  TextEditingController? clonableURLController1;
  String? Function(BuildContext, String?)? clonableURLController1Validator;
  // State field(s) for clonableURL widget.
  TextEditingController? clonableURLController2;
  String? Function(BuildContext, String?)? clonableURLController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for clonableURL widget.
  TextEditingController? clonableURLController3;
  String? Function(BuildContext, String?)? clonableURLController3Validator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for clonableURL widget.
  TextEditingController? clonableURLController4;
  String? Function(BuildContext, String?)? clonableURLController4Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for clonableURL widget.
  TextEditingController? clonableURLController5;
  String? Function(BuildContext, String?)? clonableURLController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    clonableURLController1?.dispose();
    clonableURLController2?.dispose();
    clonableURLController3?.dispose();
    clonableURLController4?.dispose();
    clonableURLController5?.dispose();
  }

  /// Additional helper methods are added here.

}
