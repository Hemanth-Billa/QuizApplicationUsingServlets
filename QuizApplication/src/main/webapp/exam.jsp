<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All The Best</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
	background-image: url('your-background-image-url');
	background-size: cover;
	background-repeat: no-repeat;
}

form {
	max-width: 800px;
	margin: 20px auto;
	background-color: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.question-container {
	margin-bottom: 20px;
	padding: 20px;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	background-color: #ffffff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.question-container:last-child {
	border-bottom: none;
	margin-bottom: 0;
	padding-bottom: 0;
}

.question-container strong {
	display: block;
	margin-bottom: 10px;
	font-size: 20px;
	color: #007bff;
}

.question-container span.question-text {
	font-size: 24px;
	font-weight: bold;
	color: black;
}

.options-container {
	margin-top: 15px;
	padding: 15px;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.options-container label {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
	transition: background-color 0.3s;
	cursor: pointer;
}

.options-container input[type="radio"] {
	opacity: 0;
	cursor: pointer;
}

.options-container label:before {
	content: '';
	width: 20px;
	height: 20px;
	border: 2px solid #007bff;
	border-radius: 50%;
	background-color: #fff;
	margin-right: 15px;
	transition: background-color 0.3s;
}

.options-container input[type="radio"]:checked+label:before {
	background-color: #007bff;
}

.options-container label span {
	font-size: 18px;
}

input[type="submit"] {
	margin-top: 20px;
	padding: 15px;
	background-color: #ffc107;
	/* Changed to another color */
	color: #ffffff;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
	transition: background-color 0.3s;
	font-weight: bold;
}

input[type="submit"]:hover {
	background-color: #ff9800;
	/* Darker shade on hover */
}

.timer-container {
	float: right;
	font-size: 18px;
	color: #007bff;
}
</style>
<script>
        document.addEventListener('DOMContentLoaded', function() {
        	var countdownTime = 15;

            // Convert minutes to milliseconds
            var countdownMilliseconds = countdownTime * 60 * 1000;

            // Set up the common timer
            var countdownTimer = setInterval(function() {
                var minutes = Math.floor(countdownMilliseconds / (60 * 1000));
                var seconds = Math.floor((countdownMilliseconds % (60 * 1000)) / 1000);

                var formattedTime = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

                // Display the time for all questions
                var timerContainers = document.querySelectorAll('.timer-container');
                timerContainers.forEach(function(timerContainer) {
                    timerContainer.textContent = "Time Left: " + formattedTime;
                });

                countdownMilliseconds -= 1000;
                if (countdownMilliseconds < 0) {
                    clearInterval(countdownTimer);
                    document.getElementById('quizForm').submit();
                }
            }, 1000);
            // Disable copy-paste
            document.addEventListener('copy', function (e) {
                e.preventDefault();
            });

            document.addEventListener('cut', function (e) {
                e.preventDefault();
            });

            document.addEventListener('paste', function (e) {
                e.preventDefault();
            });

            // Disable right-click context menu (inspect)
            document.addEventListener('contextmenu', function (e) {
                e.preventDefault();
            });

            // Disable back button (partially)
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', function () {
                history.pushState(null, null, document.URL);
            });

            // Disable form resubmission on back button
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }

            // Optional: Disable the timer if the form is manually submitted
            document.getElementById('quizForm').addEventListener('submit', function() {
                clearInterval(countdownTimer);
            });
        });
        document.addEventListener('keydown', function(e) {
            if (e.key === 'F5' || (e.ctrlKey && e.key === 'r')) {
                e.preventDefault();
            }
        });

        // Display a confirmation message when the user tries to navigate away
        window.onbeforeunload = function() {
            return "Are you sure you want to leave?";
        };

        // Prevent manual refresh (clicking browser's refresh button)
        window.addEventListener('beforeunload', function(e) {
            var confirmationMessage = "Are you sure you want to leave? , You will loose the exam";
            e.returnValue = confirmationMessage;
            return confirmationMessage;
        });
    </script>
</head>

<body>
	<div
		style="position: absolute; top: 20px; right: 20px; background-color: rgba(255, 255, 255, 0.9); padding: 10px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
		<strong>Student Name:</strong>
		<%=request.getAttribute("StudentName")%><br> <strong>Student
			ID:</strong>
		<%=request.getAttribute("StudentId")%>
	</div>
	<form action="submit" method="post">
		<!-- Repeat this block for each question  onsubmit="return validateForm()" -->
		<!-- Repeat this block for each question -->
		<div class="question-container">
			<strong>Question Number: 1</strong> <span class="question-text">What
				is your favorite color?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q1"
						id="q1_option1" value="Red" required> <label
						class="form-check-label" for="q1_option1"><span>Red</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q1"
						id="q1_option2" value="Blue" required> <label
						class="form-check-label" for="q1_option2"><span>Blue</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q1"
						id="q1_option3" value="Green" required> <label
						class="form-check-label" for="q1_option3"><span>Green</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q1"
						id="q1_option4" value="Yellow" required> <label
						class="form-check-label" for="q1_option4"><span>Yellow</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 2</strong> <span class="question-text">What
				is your favorite animal?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q2"
						id="q2_option1" value="Cat" required> <label
						class="form-check-label" for="q2_option1"><span>Cat</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q2"
						id="q2_option2" value="Dog" required> <label
						class="form-check-label" for="q2_option2"><span>Dog</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q2"
						id="q2_option3" value="Bird" required> <label
						class="form-check-label" for="q2_option3"><span>Bird</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q2"
						id="q2_option4" value="Fish" required> <label
						class="form-check-label" for="q2_option4"><span>Fish</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 3</strong> <span class="question-text">Which
				programming language do you prefer?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q3"
						id="q3_option1" value="JavaScript" required> <label
						class="form-check-label" for="q3_option1"><span>JavaScript</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q3"
						id="q3_option2" value="Python" required> <label
						class="form-check-label" for="q3_option2"><span>Python</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q3"
						id="q3_option3" value="Java" required> <label
						class="form-check-label" for="q3_option3"><span>Java</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q3"
						id="q3_option4" value="C++" required> <label
						class="form-check-label" for="q3_option4"><span>C++</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 4</strong> <span class="question-text">What
				is your favorite movie genre?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q4"
						id="q4_option1" value="Action" required> <label
						class="form-check-label" for="q4_option1"><span>Action</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q4"
						id="q4_option2" value="Comedy" required> <label
						class="form-check-label" for="q4_option2"><span>Comedy</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q4"
						id="q4_option3" value="Drama" required> <label
						class="form-check-label" for="q4_option3"><span>Drama</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q4"
						id="q4_option4" value="Sci-Fi" required> <label
						class="form-check-label" for="q4_option4"><span>Sci-Fi</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 5</strong> <span class="question-text">Which
				type of music do you enjoy the most?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q5"
						id="q5_option1" value="Pop" required> <label
						class="form-check-label" for="q5_option1"><span>Pop</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q5"
						id="q5_option2" value="Rock" required> <label
						class="form-check-label" for="q5_option2"><span>Rock</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q5"
						id="q5_option3" value="Hip Hop" required> <label
						class="form-check-label" for="q5_option3"><span>Hip
							Hop</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q5"
						id="q5_option4" value="Classical" required> <label
						class="form-check-label" for="q5_option4"><span>Classical</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 6</strong> <span class="question-text">What
				is your preferred mode of transportation?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q6"
						id="q6_option1" value="Car" required> <label
						class="form-check-label" for="q6_option1"><span>Car</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q6"
						id="q6_option2" value="Bicycle" required> <label
						class="form-check-label" for="q6_option2"><span>Bicycle</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q6"
						id="q6_option3" value="Public Transit" required> <label
						class="form-check-label" for="q6_option3"><span>Public
							Transit</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q6"
						id="q6_option4" value="Walking" required> <label
						class="form-check-label" for="q6_option4"><span>Walking</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 7</strong> <span class="question-text">What
				is your favorite type of cuisine?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q7"
						id="q7_option1" value="Italian" required> <label
						class="form-check-label" for="q7_option1"><span>Italian</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q7"
						id="q7_option2" value="Mexican" required> <label
						class="form-check-label" for="q7_option2"><span>Mexican</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q7"
						id="q7_option3" value="Chinese" required> <label
						class="form-check-label" for="q7_option3"><span>Chinese</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q7"
						id="q7_option4" value="Indian" required> <label
						class="form-check-label" for="q7_option4"><span>Indian</span></label>
				</div>
			</div>
		</div>

		<div class="question-container">
			<strong>Question Number: 8</strong> <span class="question-text">What
				is your preferred leisure activity?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q8"
						id="q8_option1" value="Reading" required> <label
						class="form-check-label" for="q8_option1"><span>Reading</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q8"
						id="q8_option2" value="Watching Movies/TV" required> <label
						class="form-check-label" for="q8_option2"><span>Watching
							Movies/TV</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q8"
						id="q8_option3" value="Traveling" required> <label
						class="form-check-label" for="q8_option3"><span>Traveling</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q8"
						id="q8_option4" value="Playing Sports" required> <label
						class="form-check-label" for="q8_option4"><span>Playing
							Sports</span></label>
				</div>
			</div>
		</div>

		<div class="question-container">
			<strong>Question Number: 9</strong> <span class="question-text">What
				is your favorite season?</span>
			<div class="timer-container" id="timer-q9"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q9"
						id="q9_option1" value="Spring" required> <label
						class="form-check-label" for="q9_option1"><span>Spring</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q9"
						id="q9_option2" value="Summer" required> <label
						class="form-check-label" for="q9_option2"><span>Summer</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q9"
						id="q9_option3" value="Fall" required> <label
						class="form-check-label" for="q9_option3"><span>Fall</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q9"
						id="q9_option4" value="Winter" required> <label
						class="form-check-label" for="q9_option4"><span>Winter</span></label>
				</div>
			</div>
		</div>

		<div class="question-container">
			<strong>Question Number: 10</strong> <span class="question-text">What
				is your favorite type of book?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q10"
						id="q10_option1" value="Mystery/Thriller" required> <label
						class="form-check-label" for="q10_option1"><span>Mystery/Thriller</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q10"
						id="q10_option2" value="Romance" required> <label
						class="form-check-label" for="q10_option2"><span>Romance</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q10"
						id="q10_option3" value="Science Fiction" required> <label
						class="form-check-label" for="q10_option3"><span>Science
							Fiction</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q10"
						id="q10_option4" value="Non-Fiction" required> <label
						class="form-check-label" for="q10_option4"><span>Non-Fiction</span></label>
				</div>
			</div>
		</div>

		<!-- Question 11 -->
		<div class="question-container">
			<strong>Question Number: 11</strong> <span class="question-text">What
				is your preferred way to stay active?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q11"
						id="q11_option1" value="Running" required> <label
						class="form-check-label" for="q11_option1"><span>Running</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q11"
						id="q11_option2" value="Cycling" required> <label
						class="form-check-label" for="q11_option2"><span>Cycling</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q11"
						id="q11_option3" value="Yoga" required> <label
						class="form-check-label" for="q11_option3"><span>Yoga</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q11"
						id="q11_option4" value="Weightlifting" required> <label
						class="form-check-label" for="q11_option4"><span>Weightlifting</span></label>
				</div>
			</div>
		</div>

		<!-- Question 12 -->
		<div class="question-container">
			<strong>Question Number: 12</strong> <span class="question-text">What
				is your favorite type of dessert?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q12"
						id="q12_option1" value="Chocolate Cake" required> <label
						class="form-check-label" for="q12_option1"><span>Chocolate
							Cake</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q12"
						id="q12_option2" value="Ice Cream" required> <label
						class="form-check-label" for="q12_option2"><span>Ice
							Cream</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q12"
						id="q12_option3" value="Cheesecake" required> <label
						class="form-check-label" for="q12_option3"><span>Cheesecake</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q12"
						id="q12_option4" value="Fruit Salad" required> <label
						class="form-check-label" for="q12_option4"><span>Fruit
							Salad</span></label>
				</div>
			</div>
		</div>

		<!-- Question 13 -->
		<div class="question-container">
			<strong>Question Number: 13</strong> <span class="question-text">Which
				type of art do you appreciate the most?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q13"
						id="q13_option1" value="Painting" required> <label
						class="form-check-label" for="q13_option1"><span>Painting</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q13"
						id="q13_option2" value="Sculpture" required> <label
						class="form-check-label" for="q13_option2"><span>Sculpture</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q13"
						id="q13_option3" value="Photography" required> <label
						class="form-check-label" for="q13_option3"><span>Photography</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q13"
						id="q13_option4" value="Dancing" required> <label
						class="form-check-label" for="q13_option4"><span>Dancing</span></label>
				</div>
			</div>
		</div>

		<div class="question-container">
			<strong>Question Number: 14</strong> <span class="question-text">What
				is your preferred mode of communication?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q14"
						id="q14_option1" value="Email" required> <label
						class="form-check-label" for="q14_option1"><span>Email</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q14"
						id="q14_option2" value="Phone" required> <label
						class="form-check-label" for="q14_option2"><span>Phone</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q14"
						id="q14_option3" value="Text Message" required> <label
						class="form-check-label" for="q14_option3"><span>Text
							Message</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q14"
						id="q14_option4" value="Face-to-Face" required> <label
						class="form-check-label" for="q14_option4"><span>Face-to-Face</span></label>
				</div>
			</div>
		</div>
		<div class="question-container">
			<strong>Question Number: 15</strong> <span class="question-text">What
				is your favorite outdoor activity?</span>
			<div class="timer-container"></div>
			<div class="options-container">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q15"
						id="q15_option1" value="Hiking" required> <label
						class="form-check-label" for="q15_option1"><span>Hiking</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q15"
						id="q15_option2" value="Camping" required> <label
						class="form-check-label" for="q15_option2"><span>Camping</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q15"
						id="q15_option3" value="Biking" required> <label
						class="form-check-label" for="q15_option3"><span>Biking</span></label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="q15"
						id="q15_option4" value="Fishing" required> <label
						class="form-check-label" for="q15_option4"><span>Fishing</span></label>
				</div>
			</div>
		</div>

		<!-- Repeat for other questions -->

		<input type="submit" value="Submit" class="btn btn-warning">
	</form>

	<!--  <script>
        function validateForm() {
            for (let i = 1; i <= 15; i++) {
                const selectedOption = document.querySelector(`input[name=q${i}]:checked`);
                if (!selectedOption) {
                    alert(`Please select an option for Question ${i}`);
                    return false;
                }
            }
            return true;
        }
    </script> -->
</body>

</html>