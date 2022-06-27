import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartDateWidget extends StatefulWidget {
  const StartDateWidget({Key key}) : super(key: key);

  @override
  _StartDateWidgetState createState() => _StartDateWidgetState();
}

class _StartDateWidgetState extends State<StartDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFD6B8AC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFD6B8AC),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              valueOrDefault<String>(
                dateTimeFormat('d/M h:mm a', FFAppState().selectedDate),
                'Start Date',
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF333333),
                  ),
            ),
            Icon(
              Icons.date_range_outlined,
              color: Color(0xFF333333),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
