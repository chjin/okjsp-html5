<%@ page contentType="text/event-stream" %>
: �� ������ �ּ��Դϴ�. 3000ms ���� Retry �˴ϴ�.
: http://sapid.sourceforge.net/ssetest/ �� �ҽ��� ��� �߽��ϴ�.

retry: 3000

data: Server sends timestamp <% out.print(System.currentTimeMillis());%>
