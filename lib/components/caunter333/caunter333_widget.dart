import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'caunter333_model.dart';
export 'caunter333_model.dart';

class Caunter333Widget extends StatefulWidget {
  const Caunter333Widget({
    Key? key,
    this.price,
  }) : super(key: key);

  final ProduktRecord? price;

  @override
  _Caunter333WidgetState createState() => _Caunter333WidgetState();
}

class _Caunter333WidgetState extends State<Caunter333Widget> {
  late Caunter333Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Caunter333Model());

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

    return Container(
      width: 160.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0xFF9E9E9E),
          width: 1.0,
        ),
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.minus,
          color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
          size: 20.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.plus,
          color: enabled
              ? FlutterFlowTheme.of(context).primary
              : Color(0xFFEEEEEE),
          size: 20.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: GoogleFonts.getFont(
            'Roboto',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        count: _model.countControllerValue ??= 1,
        updateCount: (count) async {
          setState(() => _model.countControllerValue = count);
          _model.updatePage(() {
            _model.comCauConrt = _model.comCauConrt + 1;
          });
        },
        stepSize: 1,
        minimum: 1,
        maximum: 10,
      ),
    );
  }
}
