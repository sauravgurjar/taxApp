import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'boot_class.dart';
import 'module/sentry_module.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      // Preserve splash screen until authentication complete.
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      if (Platform.isAndroid) {
        // Increases android devices preferred refresh rate to its maximum.
        await FlutterDisplayMode.setHighRefreshRate();
      }

      if (Platform.isAndroid || Platform.isIOS) {
        // Sets up allowed device orientations and other settings for the app.
        await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );
      }

      // Sets system overylay style.
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ],
      );

      // Inits sentry for error tracking.
      await initializeSentry();

      return runApp(
        // Sentrie's performance tracing for AssetBundles.
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child :const AppBootStrap(),
        ),
      );
    },
    (exception, stackTrace) async {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    },
  );
}
