import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import '/pages/category_more/category_more_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _homeManager = StreamRequestManager<List<CategoryProduktRecord>>();
  Stream<List<CategoryProduktRecord>> home({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoryProduktRecord>> Function() requestFn,
  }) =>
      _homeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomeCache() => _homeManager.clear();
  void clearHomeCacheKey(String? uniqueKey) =>
      _homeManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearHomeCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
