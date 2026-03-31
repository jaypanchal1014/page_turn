// import 'package:flutter/material.dart';

// class PageIndicator extends StatelessWidget {
//   final int current;
//   final int total;
//   final VoidCallback? onNext;
//   final VoidCallback? onPrev;

//   const PageIndicator({
//     super.key,
//     required this.current,
//     required this.total,
//     this.onNext,
//     this.onPrev,
//   });

//   static const int visibleDots = 5;

//   @override
//   Widget build(BuildContext context) {
//     if (total <= 0) return const SizedBox();

//     int start = current - (visibleDots ~/ 2);

//     if (start < 0) start = 0;
//     if (start + visibleDots > total) start = total - visibleDots;

//     if (start < 0) start = 0;

//     int end = (start + visibleDots) > total ? total : start + visibleDots;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         /// Left Arrow
//         IconButton(icon: const Icon(Icons.arrow_left), onPressed: onPrev),

//         /// Dots
//         // Row(
//         //   children: List.generate(end - start, (index) {
//         //     int pageIndex = start + index;

//         //     bool active = pageIndex == current;

//         //     return AnimatedContainer(
//         //       duration: const Duration(milliseconds: 250),
//         //       margin: const EdgeInsets.symmetric(horizontal: 4),
//         //       width: active ? 12 : 8,
//         //       height: active ? 12 : 8,
//         //       decoration: BoxDecoration(
//         //         shape: BoxShape.circle,
//         //         color: active ? Colors.blue : Colors.grey.shade400,
//         //       ),
//         //     );
//         //   }),
//         // ),

//         /// Right Arrow
//         IconButton(icon: const Icon(Icons.arrow_right), onPressed: onNext),
//       ],
//     );
//   }
// }
