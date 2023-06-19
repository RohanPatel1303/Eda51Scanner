import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eda51scanner/eda51scanner_method_channel.dart';

void main() {
  MethodChannelEda51scanner platform = MethodChannelEda51scanner();
  const MethodChannel channel = MethodChannel('eda51scanner');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
