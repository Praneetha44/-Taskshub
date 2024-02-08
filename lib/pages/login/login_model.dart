import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emaillogin widget.
  FocusNode? emailloginFocusNode;
  TextEditingController? emailloginController;
  String? Function(BuildContext, String?)? emailloginControllerValidator;
  // State field(s) for passwordlogin widget.
  FocusNode? passwordloginFocusNode;
  TextEditingController? passwordloginController;
  late bool passwordloginVisibility;
  String? Function(BuildContext, String?)? passwordloginControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordloginVisibility = false;
  }

  void dispose() {
    emailloginFocusNode?.dispose();
    emailloginController?.dispose();

    passwordloginFocusNode?.dispose();
    passwordloginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
