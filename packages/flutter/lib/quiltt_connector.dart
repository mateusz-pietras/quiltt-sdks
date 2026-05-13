library;

import 'package:flutter/widgets.dart';
import 'package:quiltt_connector/configuration.dart';
import 'package:quiltt_connector/event.dart';

// Conditional import: mobile by default, web when js_interop available
import 'src/platform/quiltt_connector_mobile.dart'
    if (dart.library.js_interop) 'src/platform/quiltt_connector_web.dart';

/// This class is the entry point for the Quiltt Connector SDK.
class QuilttConnector {
  final _platform = createPlatformConnector();

  /// The current session token used for authentication.
  String? get sessionToken => _platform.sessionToken;
  set sessionToken(String? value) => _platform.sessionToken = value;

  /// Pass token to authenticate, authenticate through UI if token is absent
  void authenticate(String token) {
    _platform.authenticate(token);
  }

  /// Connect to a connector
  void connect(
    BuildContext context,
    QuilttConnectorConfiguration config, {
    Function(ConnectorSDKOnEventCallback event)? onEvent,
    Function(ConnectorSDKOnEventExitCallback event)? onExit,
    Function(ConnectorSDKOnExitSuccessCallback event)? onExitSuccess,
    Function(ConnectorSDKOnExitAbortCallback event)? onExitAbort,
    Function(ConnectorSDKOnExitErrorCallback event)? onExitError,
  }) {
    _platform.connect(
      context,
      config,
      onEvent: onEvent,
      onExit: onExit,
      onExitSuccess: onExitSuccess,
      onExitAbort: onExitAbort,
      onExitError: onExitError,
    );
  }

  /// Reconnect to a connector
  void reconnect(
    BuildContext context,
    QuilttConnectorConfiguration config, {
    Function(ConnectorSDKOnEventCallback event)? onEvent,
    Function(ConnectorSDKOnEventExitCallback event)? onExit,
    Function(ConnectorSDKOnExitSuccessCallback event)? onExitSuccess,
    Function(ConnectorSDKOnExitAbortCallback event)? onExitAbort,
    Function(ConnectorSDKOnExitErrorCallback event)? onExitError,
  }) {
    _platform.reconnect(
      context,
      config,
      onEvent: onEvent,
      onExit: onExit,
      onExitSuccess: onExitSuccess,
      onExitAbort: onExitAbort,
      onExitError: onExitError,
    );
  }
}
