import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_produkt_check_out_model.dart';
export 'cart_produkt_check_out_model.dart';

class CartProduktCheckOutWidget extends StatefulWidget {
  const CartProduktCheckOutWidget({
    Key? key,
    this.image,
    this.name,
    this.price,
    this.quantityFRDB,
    this.weight,
    this.prodDocList,
  }) : super(key: key);

  final String? image;
  final String? name;
  final double? price;
  final int? quantityFRDB;
  final int? weight;
  final List<DocumentReference>? prodDocList;

  @override
  _CartProduktCheckOutWidgetState createState() =>
      _CartProduktCheckOutWidgetState();
}

class _CartProduktCheckOutWidgetState extends State<CartProduktCheckOutWidget> {
  late CartProduktCheckOutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartProduktCheckOutModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: StreamBuilder<List<ProductDetailRecord>>(
        stream: queryProductDetailRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<ProductDetailRecord> productContainerProductDetailRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final productContainerProductDetailRecord =
              productContainerProductDetailRecordList.isNotEmpty
                  ? productContainerProductDetailRecordList.first
                  : null;
          return Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 130.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x3A000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                width: 0.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.image!,
                          width: 74.0,
                          height: 74.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.name,
                            'name',
                          ),
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Text(
                            'Weight: ${widget.weight?.toString()} g',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  width: 130.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xCA1BAC4B),
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    count: _model.productdemandValue ??=
                                        widget.quantityFRDB!,
                                    updateCount: (count) => setState(() =>
                                        _model.productdemandValue = count),
                                    stepSize: 1,
                                    minimum: 1,
                                    maximum: 10,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'dm25uc0h' /*  $  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      (widget.price! *
                                              _model.productdemandValue!)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await productContainerProductDetailRecord!.reference
                          .delete();
                    },
                    child: Icon(
                      Icons.delete_forever_outlined,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
