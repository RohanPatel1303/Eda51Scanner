import 'package:flutter_test/flutter_test.dart';
import 'package:eda51scanner/eda51scanner.dart';
import 'package:eda51scanner/eda51scanner_platform_interface.dart';
import 'package:eda51scanner/eda51scanner_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEda51scannerPlatform
    with MockPlatformInterfaceMixin
    implements Eda51scannerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Eda51scannerPlatform initialPlatform = Eda51scannerPlatform.instance;

  test('$MethodChannelEda51scanner is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEda51scanner>());
  });

  test('getPlatformVersion', () async {
    Eda51scanner eda51scannerPlugin = Eda51scanner();
    MockEda51scannerPlatform fakePlatform = MockEda51scannerPlatform();
    Eda51scannerPlatform.instance = fakePlatform;

    // expect(await eda51scannerPlugin.getPlatformVersion(), '42');
  });
}
