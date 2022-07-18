import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_project/edit_project_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../share_with_group/share_with_group_widget.dart';
import '../who_do_what/who_do_what_widget.dart';
import '../who_done_what/who_done_what_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key key,
    this.project,
  }) : super(key: key);

  final ProjectsRecord project;

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
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
        List<UsersRecord> projectUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final projectUsersRecord = projectUsersRecordList.isNotEmpty
            ? projectUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFEED7CE),
            iconTheme: IconThemeData(color: Color(0xFF333333)),
            automaticallyImplyLeading: true,
            title: Text(
              widget.project.projectName,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF333333),
                  ),
            ),
            actions: [
              Visibility(
                visible: (widget.project.isDone) == false,
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.edit,
                    color: Color(0xFF333333),
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProjectWidget(
                          project: widget.project,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.person_add,
                    color: Color(0xFF333333),
                    size: 35,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShareWithGroupWidget(
                          project: widget.project,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFEED7CE),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.project.description,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF333333),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 290,
                  decoration: BoxDecoration(
                    color: Color(0xFFE7CBC0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                        child: Text(
                          'Meeting Times',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF333333),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 0, 16),
                                child: Text(
                                  'WhenMeet',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF333333),
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 8),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF333333),
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xFF434D5A),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                        child: Text(
                          'Tasks',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF333333),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WhoDoWhatWidget(
                                  project: widget.project,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 0, 16),
                                  child: Text(
                                    'WhoDoWhat',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF333333),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 8),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF333333),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xFF434D5A),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                        child: Text(
                          'Completed Tasks',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF333333),
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WhoDoneWhatWidget(
                                  project: widget.project,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 0, 16),
                                  child: Text(
                                    'WhoDoneWhat',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF333333),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 8),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF333333),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final projectsUpdateData = createProjectsRecordData(
                        isDone: true,
                      );
                      await widget.project.reference.update(projectsUpdateData);
                      Navigator.pop(context);
                    },
                    text: 'Mark as Done',
                    options: FFButtonOptions(
                      width: 200,
                      height: 50,
                      color: Color(0xFFCD9F8D),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF333333),
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
