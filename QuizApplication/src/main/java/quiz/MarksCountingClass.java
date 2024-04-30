package quiz;

import java.util.List;

public class MarksCountingClass {
	public static Double getMarks(List<String> list) {
		Double marks = 0.0;

		for (String answer : list) {
			if (answer.equals("Green") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Cat") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Java") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Action") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Rock") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Bicycle") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Chinese") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Reading") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Spring") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Mystery/Thriller") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Camping") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Cycling") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Photography") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Chocolate Cake") && !answer.isBlank()) {
				marks++;
			} else if (answer.equals("Phone") && !answer.isBlank()) {
				marks++;
			}
		}
		return marks;
	}
}
