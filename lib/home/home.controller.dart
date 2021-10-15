import 'package:DevQuiz/home/home.repository.dart';
import 'package:DevQuiz/home/home.state.dart';
import 'package:DevQuiz/shared/models/quiz.model.dart';
import 'package:DevQuiz/shared/models/user.model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  void set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    this.state = HomeState.loading;
    this.user = await this.repository.getUser();
    this.state = HomeState.success;
  }

  void getQuizzes() async {
    this.state = HomeState.loading;
    this.quizzes = await this.repository.getQuizzes();
    this.state = HomeState.success;
  }
}
