package yea;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class In?tServlet
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		ServletContext application = config.getServletContext();
		String ldifPath = application.getRealPath("Airius2.ldif");
		Util util = new Util(ldifPath);
		application.setAttribute("util", util);
	}

}
