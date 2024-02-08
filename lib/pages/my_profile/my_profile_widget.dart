import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_profile_model.dart';
export 'my_profile_model.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget>
    with TickerProviderStateMixin {
  late MyProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(-40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final myProfileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.0,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                'https://images.unsplash.com/photo-1434394354979-a235cd36269d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 16.0),
                            child: Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent2,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        currentUserPhoto,
                                        'data:image/png;base64,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',
                                      ),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 16.0),
                    child: Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Account Information',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('EditProfile');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 0.0, 20.0),
                                  child: Text(
                                    'Edit Profile',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 2.0,
                        thickness: 1.0,
                        indent: 0.0,
                        endIndent: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('ChangePassword');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 0.0, 20.0),
                                child: Text(
                                  'Change Password',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2.0,
                        thickness: 1.0,
                        indent: 0.0,
                        endIndent: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!(Theme.of(context).brightness ==
                                Brightness.dark))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setDarkModeSetting(context, ThemeMode.dark);
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    setState(
                                        () => hasContainerTriggered1 = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Switch to Dark Mode',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.95, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Icon(
                                                    Icons.nights_stay,
                                                    color: Color(0xFF95A1AC),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0.0),
                                                child: Container(
                                                  width: 36.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x430B0D0F),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation1']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (Theme.of(context).brightness == Brightness.dark)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setDarkModeSetting(context, ThemeMode.light);
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    setState(
                                        () => hasContainerTriggered2 = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Switch to Light Mode',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.9, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 2.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.wb_sunny_rounded,
                                                    color: Color(0xFF95A1AC),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.9, 0.0),
                                                child: Container(
                                                  width: 36.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x430B0D0F),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered2),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('SplashScreen', context.mounted);
                        },
                        text: 'Log Out',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation']!),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x230E151B),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
