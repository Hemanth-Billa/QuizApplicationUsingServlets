package quiz;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/submit")
public class ExamSubmitted extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1500880224354511624L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("fake")!=null) {
			String ans1 = req.getParameter("q1");
			String ans2 = req.getParameter("q2");
			String ans3 = req.getParameter("q3");
			String ans4 = req.getParameter("q4");
			String ans5 = req.getParameter("q5");
			String ans6 = req.getParameter("q6");
			String ans7 = req.getParameter("q7");
			String ans8 = req.getParameter("q8");
			String ans9 = req.getParameter("q9");
			String ans10 = req.getParameter("q10");
			String ans11 = req.getParameter("q11");
			String ans12 = req.getParameter("q12");
			String ans13 = req.getParameter("q13");
			String ans14 = req.getParameter("q14");
			String ans15 = req.getParameter("q15");

			List<String> answers = Arrays.asList(ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, ans11,
					ans12, ans13, ans14, ans15);
			Double marks = MarksCountingClass.getMarks(answers);
			Double totalMarks = 15.0;
			Integer percentage = (int) ((marks / totalMarks) * 100);
			req.setAttribute("totalMarks", totalMarks);
			req.setAttribute("marks", marks);
			req.setAttribute("percentage", percentage);
			req.getRequestDispatcher("marks.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("message", "Your Exam Has Been Completed Already...");
			req.getRequestDispatcher("completed.jsp").forward(req, resp);
		}

	}
}
