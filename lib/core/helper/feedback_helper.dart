import 'package:flutter/material.dart';

class FeedBackHelper {
  static showWorkoutDeleteFeedback(context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workout has been deleted!')));
  }
}
