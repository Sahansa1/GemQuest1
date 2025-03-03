import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'quiz_questions.dart'; // Ensure all quiz lists are inside this file
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final String difficulty;

  QuizScreen({required this.category, required this.difficulty});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  List<String> shuffledAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _shuffleAnswers();
  }

  void _loadQuestions() {
    Map<String, Map<String, List<QuizQuestion>>> quizData = {
      'Gem Identification and Properties': {
        'easy': gemIdentificationEasy,
        'medium': gemIdentificationMedium,
        'hard': gemIdentificationHard,
      },
      'Gem Cuts, Origins, and History': {
        'easy': gemCutsOriginsEasy,
        'medium': gemCutsOriginsMedium,
        'hard': gemCutsOriginsHard,
      },
      'Synthetic Gems, Treatments, and Care': {
        'easy': syntheticGemsEasy,
        'medium': syntheticGemsMedium,
        'hard': syntheticGemsHard,
      },
      'Final Round: Mixed Category': {
        'easy': mixedRoundEasy,
        'medium': mixedRoundMedium,
        'hard': mixedRoundHard,
      }
    };

    selectedQuestions = List.from(
        quizData[widget.category]?[widget.difficulty] ?? gemIdentificationEasy);
  }

  void _shuffleAnswers() {
    shuffledAnswers =
        List.from(selectedQuestions[currentQuestionIndex].answers);
    shuffledAnswers.shuffle();
  }

  void answerQuestion(String selectedAnswer) {
    if (isAnswered) return;
    setState(() => isAnswered = true);

    bool isCorrect = selectedAnswer ==
        selectedQuestions[currentQuestionIndex].answers[
            selectedQuestions[currentQuestionIndex].correctAnswerIndex];

    _showLottieDialog(
      isCorrect
          ? 'assets/animations/answer_correct_anim.json'
          : 'assets/animations/asnwer_wrong_anim.json',
      isCorrect ? 'Correct!' : 'Wrong!',
      isCorrect ? Colors.green : Colors.red,
    );

    if (isCorrect) score++;
  }

  void _showLottieDialog(String assetPath, String message, Color textColor) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(assetPath, width: 200, height: 200, repeat: false),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      _goToNextQuestion();
    });
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        isAnswered = false;
        _shuffleAnswers();
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
              category: widget.category,
              score: score,
              totalQuestions: selectedQuestions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} - ${widget.difficulty}'),
        backgroundColor: const Color.fromARGB(255, 2, 30, 45),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / selectedQuestions.length,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Question ${currentQuestionIndex + 1} / ${selectedQuestions.length}',
                            style: TextStyle(
                                fontSize: isLargeScreen ? 22 : 18,
                                color: Colors.black54),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            selectedQuestions[currentQuestionIndex].question,
                            style: TextStyle(
                                fontSize: isLargeScreen ? 24 : 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Column(
                            children: shuffledAnswers.map((answer) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        isLargeScreen
                                            ? screenWidth * 0.5
                                            : screenWidth * 0.8,
                                        50),
                                    backgroundColor: isAnswered
                                        ? (answer ==
                                                selectedQuestions[
                                                        currentQuestionIndex]
                                                    .answers[selectedQuestions[
                                                        currentQuestionIndex]
                                                    .correctAnswerIndex]
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.blue,
                                  ),
                                  child: Text(
                                    answer,
                                    style: TextStyle(
                                        fontSize: isLargeScreen ? 20 : 16,
                                        color: Colors.white),
                                  ),
                                  onPressed: () => answerQuestion(answer),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
