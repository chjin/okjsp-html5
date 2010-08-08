package kr.pe.okjsp.util;


public class HttpLinker {

	/**
	 * url ��ũ�� �� �ҽ��� ��ȯ�Ѵ�.
	 * @param source
	 * @return
	 */
	public String getLinkedSource(String source) {
		int lastIdxStart = 0;
		String pre = source;
		String output = "";
		while ((lastIdxStart = source.toLowerCase().lastIndexOf("http://")) > -1) {
			if (lastIdxStart == -1) {
				return source;
			}
			int lastIdxEndTag = source.indexOf("<", lastIdxStart);
			int lastIdxEnd = source.indexOf(" ", lastIdxStart);
			if (lastIdxEnd == -1) {
				lastIdxEnd = source.indexOf("\n", lastIdxStart);
			}
			if (lastIdxEnd != -1 && lastIdxEndTag != -1) {
				lastIdxEnd = Math.min(lastIdxEnd, lastIdxEndTag);
			}
			if (lastIdxEnd == -1) {
				lastIdxEnd = source.length();
			}
			String url = source.substring(lastIdxStart, lastIdxEnd).trim();
			pre = source.substring(0, lastIdxStart);
			String post = source.substring(lastIdxEnd);
			output = "<a href=\"" + url + "\" target=\"_blank\">" + url
					+ "</a>" + post + output;
			source = pre;
		}
		return pre + output;
	}
}