// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD4n--bv32EE10rA4qQvnX85cO4PggVhWM',
    appId: '1:294516963977:web:e79b8c61d786145c30e458',
    messagingSenderId: '294516963977',
    projectId: 'notes-app-a81d1',
    authDomain: 'notes-app-a81d1.firebaseapp.com',
    storageBucket: 'notes-app-a81d1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHS9PxfagojgCNFp0bid5Pk-rLXrqWwm8',
    appId: '1:294516963977:android:3fd9e6dd859edac830e458',
    messagingSenderId: '294516963977',
    projectId: 'notes-app-a81d1',
    storageBucket: 'notes-app-a81d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUIczxB1vvyS8sSDOCp8Ii0YFPHabDfu8',
    appId: '1:294516963977:ios:635737c5dc507c9630e458',
    messagingSenderId: '294516963977',
    projectId: 'notes-app-a81d1',
    storageBucket: 'notes-app-a81d1.appspot.com',
    iosClientId: '294516963977-kqc6ig3bp362iae0o7ojepj8q842l621.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUIczxB1vvyS8sSDOCp8Ii0YFPHabDfu8',
    appId: '1:294516963977:ios:dd660e573a0cfe9230e458',
    messagingSenderId: '294516963977',
    projectId: 'notes-app-a81d1',
    storageBucket: 'notes-app-a81d1.appspot.com',
    iosClientId: '294516963977-toc0fa0lu2odihl3v7c5dlit9j1a7t98.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp.RunnerTests',
  );
}
