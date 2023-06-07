import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'produkt_more_model.dart';
export 'produkt_more_model.dart';

class ProduktMoreWidget extends StatefulWidget {
  const ProduktMoreWidget({
    Key? key,
    this.productDetail,
  }) : super(key: key);

  final ProduktRecord? productDetail;

  @override
  _ProduktMoreWidgetState createState() => _ProduktMoreWidgetState();
}

class _ProduktMoreWidgetState extends State<ProduktMoreWidget>
    with TickerProviderStateMixin {
  late ProduktMoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProduktMoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
        List<CartsRecord> produktMoreCartsRecordList = snapshot.data!;
        final produktMoreCartsRecord = produktMoreCartsRecordList.isNotEmpty
            ? produktMoreCartsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            appBar: AppBar(
              backgroundColor: Color(0xFF1BAC4B),
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '9dnxydez' /* Подробнее о товаре */,
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 20.0, 0.0),
                  child: badges.Badge(
                    badgeContent: Text(
                      produktMoreCartsRecord!.productCount.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                          ),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 4.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    position: badges.BadgePosition.topStart(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'CheckOut'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<ProduktRecord> productPageProduktRecordList =
                        snapshot.data!;
                    final productPageProduktRecord =
                        productPageProduktRecordList.isNotEmpty
                            ? productPageProduktRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                widget.productDetail!.image,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: widget.productDetail!.image,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: widget.productDetail!.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            widget.productDetail!.image,
                                            width: double.infinity,
                                            height: 300.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          widget.productDetail!.name,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              widget.productDetail!.description,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (productPageProduktRecord!
                                          .specification.length >
                                      0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowRadioButton(
                                        options: productPageProduktRecord!
                                            .specification
                                            .toList(),
                                        onChanged: (val) => setState(() {}),
                                        controller: _model
                                                .radioButtonValueController ??=
                                            FormFieldController<String>(null),
                                        optionHeight: 30.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                        buttonPosition:
                                            RadioButtonPosition.left,
                                        direction: Axis.vertical,
                                        radioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveRadioButtonColor:
                                            Color(0x8A000000),
                                        toggleable: false,
                                        horizontalAlignment:
                                            WrapAlignment.start,
                                        verticalAlignment:
                                            WrapCrossAlignment.start,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 10.0, 10.0),
                                    child: FlutterFlowCheckboxGroup(
                                      options: widget
                                          .productDetail!.specification2
                                          .toList(),
                                      onChanged: (val) => setState(() =>
                                          _model.checkboxGroup2Values = val),
                                      controller: _model
                                              .checkboxGroup2ValueController ??=
                                          FormFieldController<List<String>>(
                                        productPageProduktRecord!
                                            .specification2,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor: Colors.white,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      initialized:
                                          _model.checkboxGroup2Values != null,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 40.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${widget.productDetail!.price.toString()}руб.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall,
                                          ),
                                        ),
                                        Container(
                                          width: 130.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.remove_rounded,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                Icon(
                                              Icons.add_rounded,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            count: _model
                                                .countControllerValue ??= 1,
                                            updateCount: (count) => setState(
                                                () => _model
                                                        .countControllerValue =
                                                    count),
                                            stepSize: 1,
                                            minimum: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 34.0),
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductDetailRecord>
                                  rowProductDetailRecordList = snapshot.data!;
                              final rowProductDetailRecord =
                                  rowProductDetailRecordList.isNotEmpty
                                      ? rowProductDetailRecordList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      if (!FFAppState().cart.contains(
                                          widget.productDetail!.reference))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final productDetailCreateData = {
                                                ...createProductDetailRecordData(
                                                  name: widget
                                                      .productDetail!.name,
                                                  discription: widget
                                                      .productDetail!
                                                      .description,
                                                  price: widget
                                                      .productDetail!.price,
                                                  quantity: _model
                                                      .countControllerValue,
                                                  image: widget
                                                      .productDetail!.image,
                                                  cartRef:
                                                      produktMoreCartsRecord!
                                                          .reference,
                                                  productRef: widget
                                                      .productDetail!.reference,
                                                  weight: widget
                                                      .productDetail!.weight,
                                                  modific1:
                                                      _model.radioButtonValue,
                                                ),
                                                'modific2':
                                                    _model.checkboxGroup2Values,
                                              };
                                              var productDetailRecordReference =
                                                  ProductDetailRecord.collection
                                                      .doc();
                                              await productDetailRecordReference
                                                  .set(productDetailCreateData);
                                              _model.productInCart =
                                                  ProductDetailRecord
                                                      .getDocumentFromData(
                                                          productDetailCreateData,
                                                          productDetailRecordReference);
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 100));

                                              final cartsUpdateData = {
                                                ...createCartsRecordData(
                                                  cartActive: true,
                                                ),
                                                'product_Count':
                                                    FieldValue.increment(1),
                                                'cart_Sum':
                                                    FieldValue.increment(_model
                                                            .productInCart!
                                                            .quantity *
                                                        _model.productInCart!
                                                            .price),
                                                'Product_Detail_Ref':
                                                    FieldValue.arrayUnion([
                                                  _model
                                                      .productInCart!.reference
                                                ]),
                                              };
                                              await produktMoreCartsRecord!
                                                  .reference
                                                  .update(cartsUpdateData);
                                              FFAppState().update(() {
                                                FFAppState().addToCart(widget
                                                    .productDetail!.reference);
                                              });

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'o632vg8f' /* Добавить в  корзину */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().cart.contains(
                                          widget.productDetail!.reference))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await actions
                                                  .deleteProductDetailByName(
                                                widget.productDetail!.name,
                                              );

                                              final cartsUpdateData = {
                                                'cart_Sum': FieldValue
                                                    .increment(-(_model
                                                            .countControllerValue! *
                                                        widget.productDetail!
                                                            .price)),
                                                'Product_Detail_Ref':
                                                    FieldValue.delete(),
                                                'product_Count':
                                                    FieldValue.increment(-(1)),
                                              };
                                              await produktMoreCartsRecord!
                                                  .reference
                                                  .update(cartsUpdateData);
                                              FFAppState().update(() {
                                                FFAppState().removeFromCart(
                                                    widget.productDetail!
                                                        .reference);
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'wifcvu28' /* Удалить из корзины */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 170.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xDCE21C3D),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
