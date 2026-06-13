// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Shim';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get pageNotFound => 'Page not found';

  @override
  String get unknownRouteError => 'Unknown route error';

  @override
  String get backToHome => 'Back to home';

  @override
  String get homeTitle => 'Shim';

  @override
  String get welcome => 'Shim';

  @override
  String get inject => 'Inject';

  @override
  String get injectPanelTitle => 'UI Injection';

  @override
  String get injectPanelDescription =>
      'Inject the Shim control surface into the target environment for connection, debugging, and operation.';

  @override
  String get injectReadyStatus => 'Ready to inject';

  @override
  String get readyStatus => 'Ready';

  @override
  String get systemLanguage => 'System language';

  @override
  String get chineseLanguage => 'Simplified Chinese';

  @override
  String get englishLanguage => 'English';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Light mode';

  @override
  String get darkTheme => 'Dark mode';

  @override
  String get primaryColor => 'Primary color';

  @override
  String get reset => 'Reset';

  @override
  String get codexAppPath => 'Codex path';

  @override
  String get codexAppPathNotSet => 'Not set';

  @override
  String get selectCodexExecutable => 'Select Codex executable';

  @override
  String get codexAlreadyRunning =>
      'Codex is already running, please close it first';

  @override
  String get codexPathRequired => 'Please set the Codex path in settings first';

  @override
  String launchFailed(String message) {
    return 'Launch failed: $message';
  }

  @override
  String get injectSuccess => 'Injection successful';

  @override
  String get settingsPersistedDescription =>
      'These settings are persisted with SharedPreferencesAsync.';
}
