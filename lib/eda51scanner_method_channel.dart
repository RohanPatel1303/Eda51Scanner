import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'eda51scanner_platform_interface.dart';

/// An implementation of [Eda51scannerPlatform] that uses method channels.
class MethodChannelEda51scanner extends Eda51scannerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('eda51scanner');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
