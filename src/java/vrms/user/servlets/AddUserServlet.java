package vrms.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vrms.user.classes.UserBean;
import vrms.user.classes.UserDAO;

public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String phone_no = request.getParameter("phone_no");
        String email = request.getParameter("email");
        String user_name = request.getParameter("user_name");
        String user_role = request.getParameter("user_role");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        UserBean user = new UserBean();

        user.setFirst_name(first_name);
        user.setLast_name(last_name);
        user.setGender(gender);
        user.setPhone_no(phone_no);
        user.setEmail(email);
        user.setUser_name(user_name);
        user.setUser_role(user_role);
        user.setPassword1(password1);
        user.setPassword2(password2);

        UserDAO dao = new UserDAO();
        

        if ((password1.equals(password2)) && (dao.insert(user) != null)) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('User Added Successfully!');");
            out.println("location='web_content/users/new_user.jsp';");
            out.println("</script>");
        } else {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('Something is Wrong! Please Check Again!');");
            out.println("location='web_content/users/new_user.jsp';");
            out.println("</script>");
            
        }

    }

}
