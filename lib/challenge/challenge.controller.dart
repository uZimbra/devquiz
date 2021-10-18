import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentIndexNotifier = ValueNotifier<int>(1);
  int get currentIndex => this.currentIndexNotifier.value;
  void set currentIndex(int value) => this.currentIndexNotifier.value = value;
}
