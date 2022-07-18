import '../add_events/add_events_widget.dart';
import '../backend/backend.dart';
import '../edit_event/edit_event_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WhereGotTimeWidget extends StatefulWidget {
  const WhereGotTimeWidget({Key key}) : super(key: key);

  @override
  _WhereGotTimeWidgetState createState() => _WhereGotTimeWidgetState();
}

class _WhereGotTimeWidgetState extends State<WhereGotTimeWidget> {
  DateTimeRange calendarSelectedDay;
  PagingController<DocumentSnapshot, EventsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

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
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEED7CE),
        automaticallyImplyLeading: false,
        title: Text(
          'Where Got Time',
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
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEventsWidget(),
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
                      'Scheduled Tasks',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF333333),
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
                          weekFormat: false,
                          weekStartsMonday: false,
                          initialDate: FFAppState().selectedDate,
                          onChange: (DateTimeRange newSelectedDate) async {
                            calendarSelectedDay = newSelectedDate;
                            setState(() => FFAppState().selectedDate =
                                calendarSelectedDay?.start);
                            setState(() {});
                          },
                          titleStyle: TextStyle(),
                          dayOfWeekStyle: TextStyle(),
                          dateStyle: TextStyle(),
                          selectedDateStyle: TextStyle(),
                          inactiveDateStyle: TextStyle(),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'MMMMEEEEd', FFAppState().selectedDate),
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF333333),
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: PagedListView<DocumentSnapshot<Object>, EventsRecord>(
                  pagingController: () {
                    final Query<Object> Function(Query<Object>) queryBuilder =
                        (eventsRecord) => eventsRecord
                            .where('is_deleted', isEqualTo: false)
                            .where('event_date',
                                isEqualTo: FFAppState().selectedDate);
                    if (_pagingController != null) {
                      final query = queryBuilder(EventsRecord.collection);
                      if (query != _pagingQuery) {
                        // The query has changed
                        _pagingQuery = query;
                        _streamSubscriptions.forEach((s) => s?.cancel());
                        _streamSubscriptions.clear();
                        _pagingController.refresh();
                      }
                      return _pagingController;
                    }

                    _pagingController = PagingController(firstPageKey: null);
                    _pagingQuery = queryBuilder(EventsRecord.collection);
                    _pagingController.addPageRequestListener((nextPageMarker) {
                      queryEventsRecordPage(
                        queryBuilder: (eventsRecord) => eventsRecord
                            .where('is_deleted', isEqualTo: false)
                            .where('event_date',
                                isEqualTo: FFAppState().selectedDate),
                        nextPageMarker: nextPageMarker,
                        pageSize: 25,
                        isStream: true,
                      ).then((page) {
                        _pagingController.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          final itemIndexes = _pagingController.itemList
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          data.forEach((item) {
                            final index = itemIndexes[item.reference.id];
                            final items = _pagingController.itemList;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _pagingController.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _pagingController;
                  }(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<EventsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewEventsRecord =
                          _pagingController.itemList[listViewIndex];
                      return InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditEventWidget(
                                event: listViewEventsRecord,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            listViewEventsRecord.eventName,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF333333),
                                ),
                          ),
                          subtitle: Text(
                            dateTimeFormat(
                                'Hm', listViewEventsRecord.startTime),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
