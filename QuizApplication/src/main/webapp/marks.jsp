<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Result</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .result-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .pass {
            color: #28a745;
        }

        .fail {
            color: #dc3545;
        }
    </style>
    <script>
        setTimeout(function() {
            window.location.href = 'login.html';
        }, 120000);
    </script>
</head>
<body>
    <div class="result-container">
        <%
            int percentage = (int)request.getAttribute("percentage");
            out.println("<p>Total Marks Obtained: " + request.getAttribute("marks") + "</p>");
            out.println("<p>Total Percentage: " + percentage + "%</p>");

            if (percentage < 60) {
                out.println("<p class='fail'>You have failed the exam.</p>");
            } else {
                out.println("<p class='pass'>Congratulations! You have passed the exam.</p>");
            }
            session.setMaxInactiveInterval(0);
            session.removeAttribute("fake");
            session.invalidate();
        %>
    </div>
</body>
</html>
