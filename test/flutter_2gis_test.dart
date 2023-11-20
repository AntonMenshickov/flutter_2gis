import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_2gis/flutter_2gis.dart';
import 'package:flutter_2gis/flutter_2gis_platform_interface.dart';
import 'package:flutter_2gis/flutter_2gis_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutter2gisPlatform
    with MockPlatformInterfaceMixin
    implements Flutter2gisPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Flutter2gisPlatform initialPlatform = Flutter2gisPlatform.instance;

  test('$MethodChannelFlutter2gis is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutter2gis>());
  });

  test('getPlatformVersion', () async {
    Flutter2gis flutter2gisPlugin = Flutter2gis();
    MockFlutter2gisPlatform fakePlatform = MockFlutter2gisPlatform();
    Flutter2gisPlatform.instance = fakePlatform;

    expect(await flutter2gisPlugin.getPlatformVersion(), '42');
  });
}
