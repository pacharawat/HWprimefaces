<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<h1>Servlet</h1>
<div class="prev-next-button">
    <button onclick="window.location.href = ''">< ย้อนกลับ</button>
    &nbsp;
    <button onclick="window.location.href = ''">ต่อไป > </button>
</div>

<p>
    Servlet เป็น Java class อย่างนึง  ทำหน้าที่ในการรับ Request และส่ง  Response ไปยัง client
</p>
<p>
    Servlet เป็น  Core Java Web Application <br/>หมายถึง  ทุกๆ Java Web Application จะทำงานอยู่บน Servlet <u>เสมอ</u>
</p>
<hr/>
<h1>โครงสร้างของ Http Servlet</h1>
<p>
ถ้าต้องการเขียน Servlet ขึ้นมาใช้งานเอง  เราจะต้อง extends HttpServlet<br/>
และต้อง override method doXXX ว่าจะให้ servlet นั้น  รับ Request แบบไหน 
เช่น <br/>
<br/>

doPost คือรับ request ที่มาจาก HTTP Post<br/>

doGet คือรับ  request ที่มาจาก HTTP Get<br/>

doPut คือรับ request ที่มาจาก HTTP Put<br/>

<br/>
เป็นต้น
</p>
<div class="content-left">
    <div class="content-left-content">
        <h3>ตัวอย่างที่ 1 </h3>
        HelloServlet.java
        <pre>
            <code class="java">
                <%
                    JspUtils.readContent(
                            request.getServletContext().getResourceAsStream("/servlet/HelloServlet.java"),
                            out
                    );
                %>
            </code>
        </pre>
    </div>
</div>
<div class="content-right">
    <strong>ผลลัพธ์</strong>
    <div class="example-iframe">
        <iframe src="${pageContext.request.servletContext.contextPath}/hello"></iframe>
        <button class="iframe-reload-button">โหลดผลลัพธ์ใหม่</button>
    </div>
</div>
<div class="clear"></div>
<div class="content-left">
    <div class="content-left-content">
        <h3>ตัวอย่างที่ 2 </h3>
        LoginServlet.java
        <pre>
            <code class="java">
                <%
                    JspUtils.readContent(
                            request.getServletContext().getResourceAsStream("/servlet/LoginServlet.java"),
                            out
                    );
                %>
            </code>
        </pre>
    </div>
</div>
<div class="content-right">
    <strong>ผลลัพธ์</strong>
    <div class="example-iframe">
        <iframe src="example2.html"></iframe>
        <button class="iframe-reload-button">โหลดผลลัพธ์ใหม่</button>
    </div>
</div>
<div class="clear"></div>
<%@include file="/template/footer.jsp" %>
