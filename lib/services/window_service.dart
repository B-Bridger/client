import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowService {
  static bool get isDesktopPlatform {
    return !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
  }

  static Future<void> initialize() async {
    if (!isDesktopPlatform) return;

    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      size: Size(1200, 800),
      minimumSize: Size(800, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    // bitsdojo_window 설정 (Windows/Linux용)
    if (Platform.isWindows || Platform.isLinux) {
      doWhenWindowReady(() {
        final win = appWindow;
        final initialSize = Size(1200, 800);
        final minSize = Size(800, 600);
        win.minSize = minSize;
        win.size = initialSize;
        win.alignment = Alignment.center;
        win.title = "Bridger";
        win.show();
      });
    }
  }

  static Future<void> setTitle(String title) async {
    if (!isDesktopPlatform) return;
    await windowManager.setTitle(title);
  }

  static Future<void> setMinimumSize(Size size) async {
    if (!isDesktopPlatform) return;
    await windowManager.setMinimumSize(size);
  }

  static Future<void> setMaximizable(bool maximizable) async {
    if (!isDesktopPlatform) return;
    await windowManager.setMaximizable(maximizable);
  }

  static Future<void> setResizable(bool resizable) async {
    if (!isDesktopPlatform) return;
    await windowManager.setResizable(resizable);
  }

  static Future<void> center() async {
    if (!isDesktopPlatform) return;
    await windowManager.center();
  }

  static Future<void> minimize() async {
    if (!isDesktopPlatform) return;
    await windowManager.minimize();
  }

  static Future<void> maximize() async {
    if (!isDesktopPlatform) return;
    await windowManager.maximize();
  }

  static Future<void> unmaximize() async {
    if (!isDesktopPlatform) return;
    await windowManager.unmaximize();
  }

  static Future<bool> isMaximized() async {
    if (!isDesktopPlatform) return false;
    return await windowManager.isMaximized();
  }

  static Future<void> close() async {
    if (!isDesktopPlatform) return;
    await windowManager.close();
  }
}
