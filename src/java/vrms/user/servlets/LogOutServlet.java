package vrms.user.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        session.removeAttribute("first_name");
        session.setAttribute("first_name", null);
        session.removeAttribute("user_role");
        session.setAttribute("user_role", null);
        session.invalidate();
        response.sendRedirect("login.html");
        
    }

}
