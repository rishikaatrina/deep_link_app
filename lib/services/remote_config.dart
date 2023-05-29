import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<void> fetchRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  try {
    // Set default values for your remote config keys
    final defaults = <String, dynamic>{
      'welcome_message': 'Welcome to the app!',
      'feature_enabled': false,
    };
    // Apply default values to remote config
    await remoteConfig.setDefaults(defaults);

    // Fetch remote config values with a timeout
    await remoteConfig.fetch();

    // Activate fetched values
    await remoteConfig.activate();
    print('active');
  } catch (e) {
    print('Error fetching remote config: $e');
  }
}
