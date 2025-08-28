import 'dart:io';

void main() {
//Declare constants
  const.double passingGradeThreshold = 60.0; 
  const.double maxScore = 100.0;             
  const.double assignmentWeight = 0.2;       
  const.double midtermWeight = 0.3;          
  const.double finalExamWeight = 0.5;        

 //Ask for student's name
  stdout.write("Enter student's name: ");
  String studentName = stdin.readLineSync() ?? "Unknown";

//Ask for scores with validation  
  double assignmentScore = getValidScore("Assignment", maxScore);
  double midtermScore = getValidScore("Midterm", maxScore);
  double finalExamScore = getValidScore("Final Exam", maxScore);

  
//Compute final grade 
  double finalGrade = (assignmentScore * assignmentWeight) +
      (midtermScore * midtermWeight) +
      (finalExamScore * finalExamWeight);

//Determine Pass/Fail  
  String status = finalGrade >= passingGradeThreshold ? "Passed " : "Failed ";

//Display results  
  print("\n===== STUDENT GRADE REPORT =====");
  print("Student Name   : $studentName");
  print("Assignment     : ${assignmentScore.toStringAsFixed(1)}");
  print("Midterm        : ${midtermScore.toStringAsFixed(1)}");
  print("Final Exam     : ${finalExamScore.toStringAsFixed(1)}");
  print("--------------------------------");
  print("Final Grade    : ${finalGrade.toStringAsFixed(1)}");
  print("Result         : $status");
  print("================================");
}


double getValidScore(String examType, double maxScore) {
  double? score;
  while (true) {
    try {
      stdout.write("Enter $examType score (0 - $maxScore): ");
      score = double.parse(stdin.readLineSync()!);

      if (score < 0 || score > maxScore) {
        print(" Error: $examType score must be between 0 and $maxScore.");
      } else {
        break; // valid input
      }
    } catch (e) {
      print(" Error: Invalid input. Please enter numbers only.");
    }
  }
  return score!;
}