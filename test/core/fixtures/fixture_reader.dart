import 'dart:io';

String fixtureTimeKeeperDetail(String name) => File('test/core/fixtures/$name').readAsStringSync();