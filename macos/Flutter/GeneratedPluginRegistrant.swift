//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audioplayers_darwin
import connectivity_macos
import kraken
import kraken_video_player
import path_provider_macos
import shared_preferences_macos
import sqflite

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioplayersDarwinPlugin.register(with: registry.registrar(forPlugin: "AudioplayersDarwinPlugin"))
  ConnectivityPlugin.register(with: registry.registrar(forPlugin: "ConnectivityPlugin"))
  KrakenPlugin.register(with: registry.registrar(forPlugin: "KrakenPlugin"))
  FLTKrakenVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FLTKrakenVideoPlayerPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
