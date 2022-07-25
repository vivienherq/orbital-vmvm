import '../add_meeting/add_meeting_widget.dart';
import '../backend/backend.dart';
import '../edit_meeting/edit_meeting_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhenMeetWidget extends StatefulWidget {
  const WhenMeetWidget({
    Key key,
    this.project,
  }) : super(key: key);

  final ProjectsRecord project;

  @override
  _WhenMeetWidgetState createState() => _WhenMeetWidgetState();
}

class _WhenMeetWidgetState extends State<WhenMeetWidget> {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEED7CE),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WhenMeet',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF333333),
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFEED7CE),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFFCD9F8D),
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.add,
            color: Color(0xFFF6F2EF),
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 270),
                reverseDuration: Duration(milliseconds: 270),
                child: AddMeetingWidget(
                  project: widget.project,
                ),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.project.projectName,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF333333),
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowCalendar(
                          color: Color(0xFFCD9F8D),
                          weekFormat: true,
                          weekStartsMonday: false,
                          onChange: (DateTimeRange newSelectedDate) async {
                            calendarSelectedDay = newSelectedDate;
                            setState(() => FFAppState().selectedDateProj =
                                calendarSelectedDay?.start);
                            setState(() {});
                          },
                          titleStyle: TextStyle(),
                          dayOfWeekStyle: TextStyle(),
                          dateStyle: TextStyle(),
                          selectedDateStyle: TextStyle(),
                          inactiveDateStyle: TextStyle(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            'Members\' Schedules',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF333333),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              StreamBuilder<List<EventsRecord>>(
                stream: queryEventsRecord(
                  queryBuilder: (eventsRecord) => eventsRecord
                      .where('event_date',
                          isEqualTo: FFAppState().selectedDateProj)
                      .where('created_by',
                          whereIn: widget.project.sharedWith.toList())
                      .orderBy('start_time'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<EventsRecord> listViewEventsRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewEventsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewEventsRecord =
                          listViewEventsRecordList[listViewIndex];
                      return ListTile(
                        title: Text(
                          '${listViewEventsRecord.userName} is unavailable',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF333333),
                              ),
                        ),
                        subtitle: Text(
                          '${dateTimeFormat('d/M', listViewEventsRecord.eventDate)}, ${dateTimeFormat('jm', listViewEventsRecord.startTime)} to ${dateTimeFormat('jm', listViewEventsRecord.endTime)}',
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF333333),
                                  ),
                        ),
                        tileColor: Color(0xFFEED7CE),
                        dense: false,
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Text(
                  'Upcoming Meetings',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF333333),
                      ),
                ),
              ),
              StreamBuilder<List<MeetingsRecord>>(
                stream: queryMeetingsRecord(
                  queryBuilder: (meetingsRecord) => meetingsRecord
                      .where('project_id', isEqualTo: widget.project.projectId)
                      .where('is_deleted', isEqualTo: false)
                      .where('meeting_date',
                          isGreaterThanOrEqualTo: getCurrentTimestamp),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<MeetingsRecord> listViewMeetingsRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMeetingsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMeetingsRecord =
                          listViewMeetingsRecordList[listViewIndex];
                      return InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditMeetingWidget(
                                meeting: listViewMeetingsRecord,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            listViewMeetingsRecord.meetingName,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF333333),
                                ),
                          ),
                          subtitle: Text(
                            '${dateTimeFormat('d/M', listViewMeetingsRecord.meetingDate)}, ${dateTimeFormat('jm', listViewMeetingsRecord.startTime)} to ${dateTimeFormat('jm', listViewMeetingsRecord.endTime)}',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF333333),
                                    ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: Color(0xFFEED7CE),
                          dense: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
