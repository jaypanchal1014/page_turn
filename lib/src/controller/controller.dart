import 'package:flutter/material.dart';

class PageTurnController {

  PageController? _controller;

  /// Attach PageController internally
  void attach(PageController controller) {
    _controller = controller;
  }

  /// Go to next page
  void nextPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) {

    if (_controller == null) return;

    _controller!.nextPage(
      duration: duration,
      curve: curve,
    );

  }

  /// Go to previous page
  void previousPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) {

    if (_controller == null) return;

    _controller!.previousPage(
      duration: duration,
      curve: curve,
    );

  }

  /// Jump directly to page
  void jumpToPage(int page) {

    if (_controller == null) return;

    _controller!.jumpToPage(page);

  }

}