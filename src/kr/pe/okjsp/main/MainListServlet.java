package kr.pe.okjsp.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.ListHandler;

/**
 * ���ο��� ������ �ö�ý� �ǽð����� ������ �����ش�
 * bbsid �� 2�� �ƴϰ� twitter �� �ƴϰ� null�� �ƴѰ͸� ������ �ɾ���...
 * (���� �ҽ��� �����Ǿ� �ִµ���...)
 * @author hwayoung.kang
 *
 */
public class MainListServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException {
	PrintWriter out = res.getWriter();

	res.setContentType("text/event-stream");
	res.setCharacterEncoding("utf-8");

	ListHandler hand = new ListHandler();
	
	out.write("retry: 10000");
	out.write("\n");
	out.write("\n");
	try {
		int tmp = hand.getAllRecentMaxSeq();
		out.write("data: " + tmp);
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	out.flush();

	out.close();

    }

}
