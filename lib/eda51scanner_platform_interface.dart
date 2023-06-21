// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// import 'eda51scanner_method_channel.dart';
//
// abstract class Eda51scannerPlatform extends PlatformInterface {
//   /// Constructs a Eda51scannerPlatform.
//   Eda51scannerPlatform() : super(token: _token);
//
//   static final Object _token = Object();
//
//   static Eda51scannerPlatform _instance = MethodChannelEda51scanner();
//
//   /// The default instance of [Eda51scannerPlatform] to use.
//   ///
//   /// Defaults to [MethodChannelEda51scanner].
//   static Eda51scannerPlatform get instance => _instance;
//
//   /// Platform-specific implementations should set this with their own
//   /// platform-specific class that extends [Eda51scannerPlatform] when
//   /// they register themselves.
//   static set instance(Eda51scannerPlatform instance) {
//     PlatformInterface.verifyToken(instance, _token);
//     _instance = instance;
//   }
//
//   Future<String?> getPlatformVersion() {
//     throw UnimplementedError('platformVersion() has not been implemented.');
//   }
// }
