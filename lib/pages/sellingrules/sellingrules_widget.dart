import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sellingrules_model.dart';
export 'sellingrules_model.dart';

class SellingrulesWidget extends StatefulWidget {
  const SellingrulesWidget({Key? key}) : super(key: key);

  @override
  _SellingrulesWidgetState createState() => _SellingrulesWidgetState();
}

class _SellingrulesWidgetState extends State<SellingrulesWidget> {
  late SellingrulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellingrulesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'nj1dghdk' /* Правила продажи */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 22.0,
                ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '2ae5i04d' /* Текст */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
