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
import 'check_out_model.dart';
export 'check_out_model.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({Key? key}) : super(key: key);

  @override
  _CheckOutWidgetState createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  late CheckOutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckOutModel());

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

    return StreamBuilder<List<CartsRecord>>(
      stream: queryCartsRecord(
        queryBuilder: (cartsRecord) =>
            cartsRecord.where('user_Ref', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<CartsRecord> checkOutCartsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final checkOutCartsRecord = checkOutCartsRecordList.isNotEmpty
            ? checkOutCartsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  '5k2tiadm' /* Оформление заказа */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: StreamBuilder<List<CountOrderRecord>>(
                stream: queryCountOrderRecord(
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
                  List<CountOrderRecord> columnCountOrderRecordList =
                      snapshot.data!;
                  final columnCountOrderRecord =
                      columnCountOrderRecordList.isNotEmpty
                          ? columnCountOrderRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 0.0, 0.0),
                          child: StreamBuilder<List<ProduktRecord>>(
                            stream: queryProduktRecord(
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProduktRecord>
                                  mainContainerProduktRecordList =
                                  snapshot.data!;
                              final mainContainerProduktRecord =
                                  mainContainerProduktRecordList.isNotEmpty
                                      ? mainContainerProduktRecordList.first
                                      : null;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Товаров на сумму: ${checkOutCartsRecord!.cartSum.toString()}руб.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CategoryMoreWidget(),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.add_shopping_cart,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 32.0,
                                            ),
                                          ),
                                          StreamBuilder<
                                              List<ProductDetailRecord>>(
                                            stream: queryProductDetailRecord(
                                              queryBuilder:
                                                  (productDetailRecord) =>
                                                      productDetailRecord.where(
                                                          'Cart_Ref',
                                                          isEqualTo:
                                                              checkOutCartsRecord!
                                                                  .reference),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitCircle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductDetailRecord>
                                                  buttonProductDetailRecordList =
                                                  snapshot.data!;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  await actions.deleteRecords(
                                                    buttonProductDetailRecordList
                                                        .map((e) => e.reference)
                                                        .toList(),
                                                  );

                                                  final cartsUpdateData = {
                                                    ...createCartsRecordData(
                                                      productCount: 0,
                                                      cartSum: 0.0,
                                                    ),
                                                    'Product_Detail_Ref':
                                                        FieldValue.delete(),
                                                  };
                                                  await checkOutCartsRecord!
                                                      .reference
                                                      .update(cartsUpdateData);
                                                  FFAppState().update(() {
                                                    FFAppState().deleteCart();
                                                    FFAppState().cart = [];
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  't2ithmnm' /* Очистить */,
                                                ),
                                                icon: Icon(
                                                  Icons.clear,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 120.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xDCE21C3D),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Stack(
                                          children: [
                                            StreamBuilder<
                                                List<ProductDetailRecord>>(
                                              stream: queryProductDetailRecord(
                                                queryBuilder: (productDetailRecord) =>
                                                    productDetailRecord.where(
                                                        'Cart_Ref',
                                                        isEqualTo:
                                                            checkOutCartsRecord!
                                                                .reference),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProductDetailRecord>
                                                    columnProductDetailRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnProductDetailRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnProductDetailRecord =
                                                        columnProductDetailRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: 120.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child: Image
                                                                      .network(
                                                                    columnProductDetailRecord
                                                                        .image,
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        columnProductDetailRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        'Количество: ${columnProductDetailRecord.quantity.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        'Цена: ${columnProductDetailRecord.price.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        'Сумма: ${(columnProductDetailRecord.quantity * columnProductDetailRecord.price).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .leftToRight,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            ProduktMoreCopyWidget(
                                                                          productDetail:
                                                                              columnProductDetailRecord,
                                                                          product:
                                                                              mainContainerProduktRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .edit_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await columnProductDetailRecord
                                                                        .reference
                                                                        .delete();

                                                                    final cartsUpdateData =
                                                                        {
                                                                      'product_Count':
                                                                          FieldValue.increment(
                                                                              -(1)),
                                                                      'cart_Sum': FieldValue.increment(-(columnProductDetailRecord
                                                                              .quantity *
                                                                          columnProductDetailRecord
                                                                              .price)),
                                                                      'Product_Detail_Ref':
                                                                          FieldValue
                                                                              .delete(),
                                                                    };
                                                                    await checkOutCartsRecord!
                                                                        .reference
                                                                        .update(
                                                                            cartsUpdateData);
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .removeFromCart(
                                                                              columnProductDetailRecord.productRef!);
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete_sweep,
                                                                    color: Color(
                                                                        0xDCE21C3D),
                                                                    size: 28.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                            if (checkOutCartsRecord!
                                                    .productCount <
                                                1)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 120.0),
                                                child: Container(
                                                  height: 200.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .cartIsEmptyModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          CartIsEmptyWidget(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.96,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x3A000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3ltv6tyc' /* Итого по заказу */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'dsf48lg7' /* Промежуточный итог */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                  Text(
                                                    '${checkOutCartsRecord!.cartSum.toString()} руб.',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2ycc1j7p' /* Доставка */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      '${FFAppState().DeliveryPrice.toString()} руб. ',
                                                      '0 руб.',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vfxejdfs' /* Итого */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${(checkOutCartsRecord!.cartSum + FFAppState().DeliveryPrice).toString()} руб. ',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.0,
                                              color: Color(0x3416202A),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeliveryMethodWidget(),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.mapMarkerAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'eh15gve6' /* Адрес доставки */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .DelveryIS,
                                                            'Не выбран',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.9, 0.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.0,
                                              color: Color(0x3416202A),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentMethodWidget(),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'h2sbsrfu' /* Способ оплаты */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .PaymentIs,
                                                          'Не выбран',
                                                        ),
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.9, 0.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 50.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (((checkOutCartsRecord!
                                                                  .cartSum >
                                                              0.0) &&
                                                          (FFAppState()
                                                                      .DelveryIS !=
                                                                  null &&
                                                              FFAppState()
                                                                      .DelveryIS !=
                                                                  '')) &&
                                                      (FFAppState().PaymentIs !=
                                                              null &&
                                                          FFAppState()
                                                                  .PaymentIs !=
                                                              '')) {
                                                    final ordersCreateData = {
                                                      ...createOrdersRecordData(
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                        orderNumber:
                                                            columnCountOrderRecord!
                                                                    .number +
                                                                1,
                                                        orderStatus: 'Новый',
                                                        subtotal:
                                                            checkOutCartsRecord!
                                                                .cartSum,
                                                        userRef:
                                                            currentUserReference,
                                                        numberOfGoods:
                                                            checkOutCartsRecord!
                                                                .productCount,
                                                        total: checkOutCartsRecord!
                                                                .cartSum +
                                                            FFAppState()
                                                                .DeliveryPrice,
                                                        paymentMethods:
                                                            FFAppState()
                                                                .PaymentIs,
                                                        deliveryAddress:
                                                            FFAppState()
                                                                .DelveryIS,
                                                        contactName:
                                                            currentUserDisplayName,
                                                        phoneNumber:
                                                            currentPhoneNumber,
                                                        deliveryPrice:
                                                            FFAppState()
                                                                .DeliveryPrice,
                                                        deliveryMethod: FFAppState()
                                                                    .DeliveryPrice >
                                                                0.0
                                                            ? 'Доставка курьером'
                                                            : 'Самовывоз',
                                                      ),
                                                      'Product_List':
                                                          checkOutCartsRecord!
                                                              .productDetailRef,
                                                      'specific':
                                                          checkOutCartsRecord!
                                                              .productDetailRef
                                                              .map((e) => e.id)
                                                              .toList(),
                                                      'specific1':
                                                          checkOutCartsRecord!
                                                              .productDetailRef
                                                              .map((e) => e.id)
                                                              .toList(),
                                                    };
                                                    await OrdersRecord
                                                        .collection
                                                        .doc()
                                                        .set(ordersCreateData);

                                                    final countOrderUpdateData =
                                                        {
                                                      'number':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await columnCountOrderRecord!
                                                        .reference
                                                        .update(
                                                            countOrderUpdateData);
                                                    await actions
                                                        .removeCartRefFromDocuments(
                                                      checkOutCartsRecord!
                                                          .productDetailRef
                                                          .toList(),
                                                    );

                                                    final cartsUpdateData = {
                                                      ...createCartsRecordData(
                                                        productCount: 0,
                                                        cartSum: 0.0,
                                                      ),
                                                      'Product_Detail_Ref':
                                                          FieldValue.delete(),
                                                    };
                                                    await checkOutCartsRecord!
                                                        .reference
                                                        .update(
                                                            cartsUpdateData);
                                                    FFAppState().update(() {
                                                      FFAppState().deleteCart();
                                                      FFAppState().cart = [];

                                                      FFAppState()
                                                          .deleteDeliveryPrice();
                                                      FFAppState()
                                                          .DeliveryPrice = 0.0;

                                                      FFAppState()
                                                          .deleteDelveryIS();
                                                      FFAppState().DelveryIS =
                                                          '';
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Вы не можете оформить заказ, так как у Вас пуста корзина, либо  не указан адрес доставки!',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4550),
                                                        backgroundColor:
                                                            Color(0xDCE21C3D),
                                                      ),
                                                    );
                                                    return;
                                                  }

                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeft,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      reverseDuration: Duration(
                                                          milliseconds: 500),
                                                      child:
                                                          OrderComplitedWidget(),
                                                    ),
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'htjf8xpt' /* Оформить заказ */,
                                                ),
                                                icon: Icon(
                                                  Icons.attach_money_rounded,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
