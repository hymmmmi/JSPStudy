package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {
	
	PrintWriter writer;

	public void init(FilterConfig config) throws ServletException {
		String filename=config.getInitParameter("filename");
		
		if(filename == null)
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true),true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws java.io.IOException, ServletException {
		System.out.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println(" 접근한 URL 경로 : " + getURLPath(request));
		System.out.println(" 요청 처리 시작 시각 : " + getCurrentTime());
		
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println(" 요청 처리 종료 시각 : " + getCurrentTime());
		System.out.println(" 요청 처리 소요 시간 : " + (end-start)+"ms ");
		System.out.println("============================================");
	}
	

	public void destroy() {
		writer.close();
		
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String querString="";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest)request;
			currentPath=req.getRequestURI();
			querString=req.getQueryString();
			querString=querString==null ? "" : "?" + querString;
		}
		return currentPath+querString;
	}
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:SS");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
}
