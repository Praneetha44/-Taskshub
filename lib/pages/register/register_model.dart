import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameController;
  String? Function(BuildContext, String?)? fullnameControllerValidator;
  // State field(s) for emailsignup widget.
  FocusNode? emailsignupFocusNode;
  TextEditingController? emailsignupController;
  String? Function(BuildContext, String?)? emailsignupControllerValidator;
  // State field(s) for passwordsignup widget.
  FocusNode? passwordsignupFocusNode;
  TextEditingController? passwordsignupController;
  late bool passwordsignupVisibility;
  String? Function(BuildContext, String?)? passwordsignupControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordsignupVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode?.dispose();
    fullnameController?.dispose();

    emailsignupFocusNode?.dispose();
    emailsignupController?.dispose();

    passwordsignupFocusNode?.dispose();
    passwordsignupController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
