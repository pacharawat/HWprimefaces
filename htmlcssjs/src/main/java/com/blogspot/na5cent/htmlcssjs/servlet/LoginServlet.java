
package com.blogspot.na5cent.htmlcssjs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anonymous
 */
@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String redirectPath;
        if ("admin".equals(username) && "admin".equals(password)) {
            redirectPath = "/servlet/example2-success.html";
        } else {
            redirectPath = "/servlet/example2-fail.html";
        }

        resp.sendRedirect(
                req.getServletContext().getContextPath() + redirectPath
        );
    }

}
