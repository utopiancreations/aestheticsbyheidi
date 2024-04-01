import '/flutter_flow/flutter_flow_util.dart';
import 'photo_display_widget.dart' show PhotoDisplayWidget;
import 'package:flutter/material.dart';

class PhotoDisplayModel extends FlutterFlowModel<PhotoDisplayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
