package quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/exam")
public class ExamServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4811872224651627568L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String string  = "fake";
		session.setAttribute("fake", string);
		if(session != null && session.getAttribute("fake")!=null) {
			req.setAttribute("StudentName", req.getParameter("studentName"));
			req.setAttribute("StudentId", req.getParameter("studentId"));
		req.getRequestDispatcher("exam.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("message", "You Have Already Attempted This Exam...");
			req.getRequestDispatcher("completed.jsp").forward(req, resp);
		}
	}
}
