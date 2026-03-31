import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_page_turn/src/controller/controller.dart';
import 'package:flutter_page_turn/src/effects/slide.dart';
import 'package:flutter_page_turn/src/model/page_turn_effect.dart';

class PageTurnView extends StatefulWidget {
  final int itemCount;

  final Widget Function(BuildContext context, int index) itemBuilder;

  final bool autoPlay;
  final Axis axis;

  final Duration autoPlayDelay;

  final bool showIndicator;

  final PageTurnController? controller;

  final PageTurnEffect effect;

  const PageTurnView.builder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.autoPlay = false,
    this.autoPlayDelay = const Duration(seconds: 3),
    this.showIndicator = false,
    this.controller,
    this.effect = PageTurnEffect.slide,
    this.axis = Axis.horizontal,
  });

  @override
  State<PageTurnView> createState() => _PageTurnViewState();
}

class _PageTurnViewState extends State<PageTurnView> {
  late PageController _pageController;

  int currentPage = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    widget.controller?.attach(_pageController);

    if (widget.autoPlay) {
      startAutoPlay();
    }
  }

  void startAutoPlay() {
    timer = Timer.periodic(widget.autoPlayDelay, (timer) {
      int next = currentPage + 1;

      if (next >= widget.itemCount) {
        next = 0;
      }

      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            scrollDirection: widget.axis,
            controller: _pageController,

            itemCount: widget.itemCount,

            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },

            itemBuilder: (context, index) {
              final child = widget.itemBuilder(context, index);

              return AnimatedBuilder(
                animation: _pageController,

                builder: (context, _) {
                  double value = 0;

                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page ?? 0) - index;
                  }

                  switch (widget.effect) {
                    case PageTurnEffect.flip:
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(value),
                        child: child,
                      );

                    case PageTurnEffect.curl:
                      return Transform.scale(
                        scale: 1 - (value.abs() * 0.2),
                        child: child,
                      );

                    case PageTurnEffect.slide:
                      return SlideEffect(
                        child: child,
                        value: value,
                        axis: widget.axis,
                      );
                  }
                },
              );
            },
          ),
        ),
        // PageIndicator(
        //   current: currentPage,
        //   total: widget.itemCount,
        //   onNext: () => widget.controller?.nextPage(),
        //   onPrev: () => widget.controller?.previousPage(),
        // ),
      ],
    );
  }
}
