package vrms.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vrms.user.classes.UserBean;
import vrms.user.classes.UserDAO;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserBean user = new UserBean();
            user.setUser_name(request.getParameter("user_name"));
            user.setPassword1(request.getParameter("password"));

            UserDAO dao = new UserDAO();
            ResultSet result = dao.check(user);

            if (result.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("first_name", result.getString("first_name"));
                session.setAttribute("user_role", result.getString("user_role"));
                session.setMaxInactiveInterval(600);
                RequestDispatcher dispatch = request.getRequestDispatcher("web_content/dashboard.jsp");
                dispatch.forward(request, response);
            } else {
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("window.alert('Username/Password is Wrong! Please Check Again!');");
                out.println("location='login.html';");
                out.println("</script>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
