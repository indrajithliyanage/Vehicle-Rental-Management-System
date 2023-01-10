package vrms.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vrms.user.classes.UserBean;
import vrms.user.classes.UserDAO;

public class UpdateDeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String user_name = request.getParameter("user_name");
        UserDAO dao = new UserDAO();
        UserBean user = new UserBean();
        PrintWriter out = response.getWriter();

        if (user_name.equals("") || user_name.equals("null")) {

            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert('User Name can not be empty!');");
            out.println("location='web_content/users/update_user.jsp';");
            out.println("</script>");

        } else {

            if (action.equals("Update")) {

                String new_first_name = request.getParameter("first_name");
                String new_last_name = request.getParameter("last_name");
                String new_gender = request.getParameter("gender");
                String new_phone_no = request.getParameter("phone_no");
                String new_email = request.getParameter("email");
                String new_user_role = request.getParameter("user_role");
                String new_password1 = request.getParameter("password1");
                String new_password2 = request.getParameter("password2");

                dao.viewSpecific(user, user_name);

                if (new_first_name != null && !new_first_name.isEmpty()) {
                    user.setFirst_name(new_first_name);
                }
                if (new_last_name != null && !new_last_name.isEmpty()) {
                    user.setLast_name(new_last_name);
                }
                if (new_gender != null && !new_gender.isEmpty()) {
                    user.setGender(new_gender);
                }
                if (new_phone_no != null && !new_phone_no.isEmpty()) {
                    user.setPhone_no(new_phone_no);
                }
                if (new_email != null && !new_email.isEmpty()) {
                    user.setEmail(new_email);
                }
                if (!new_user_role.equals("null")) {
                    user.setUser_role(new_user_role);
                }

                if (new_password1.equals(new_password2)) {
                    if (new_password1 != null && !new_password1.isEmpty()) {
                        user.setPassword1(new_password1);
                    }
                    if (new_password2 != null && !new_password2.isEmpty()) {
                        user.setPassword2(new_password2);
                    }
                } else {
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.alert('Passwords should be the same!');");
                    out.println("location='web_content/users/update_user.jsp';");
                    out.println("</script>");
                }

                if (dao.update(user, user_name) != 0) {

                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.alert('User Updated Successfully!');");
                    out.println("location='web_content/users/update_user.jsp';");
                    out.println("</script>");

                } else {
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.alert('User could not be Updated! Try Again!');");
                    out.println("location='web_content/users/update_user.jsp';");
                    out.println("</script>");
                }

            } else if (action.equals("Delete")) {

                if (dao.delete(user_name) != 0) {

                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.alert('User Deleted Successfully!');");
                    out.println("location='web_content/users/update_user.jsp';");
                    out.println("</script>");

                } else {
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.alert('Something went wrong! Please Try Again!');");
                    out.println("location='web_content/users/update_user.jsp';");
                    out.println("</script>");
                }

            }

        }

    }

}
