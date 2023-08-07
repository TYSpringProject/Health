<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>달력</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
    </style>
</head>
<body>

<%
    // 현재 연도와 월을 가져옵니다.
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int year = cal.get(java.util.Calendar.YEAR);
    int month = cal.get(java.util.Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더합니다.

    // 해당 월의 첫 날과 마지막 날을 계산합니다.
    java.util.Calendar firstDay = java.util.Calendar.getInstance();
    firstDay.set(year, month - 1, 1);
    int firstDayOfWeek = firstDay.get(java.util.Calendar.DAY_OF_WEEK);
    int lastDay = firstDay.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

    // 달력 테이블 생성
    out.print("<table>");
    out.print("<tr><th colspan='7'>" + year + "년 " + month + "월</th></tr>");
    out.print("<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>");

    // 첫 주의 빈 칸을 채웁니다.
    out.print("<tr>");
    for (int i = 1; i < firstDayOfWeek; i++) {
        out.print("<td></td>");
    }

    // 달력 날짜 출력
    int day = 1;
    for (int i = firstDayOfWeek; i <= 7; i++) {
        out.print("<td>" + day + "</td>");
        day++;
        
        
    }
    out.print("</tr>");

    while (day <= lastDay) {
        out.print("<tr>");
        for (int i = 1; i <= 7 && day <= lastDay; i++) {
            out.print("<td>" + day + "</td>");
            day++;
        }
        out.print("</tr>");
    }

    out.print("</table>");
%>

</body>
</html>
