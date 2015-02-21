<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<h1>การทำงานของ Java Web Application</h1>
<div class="prev-next-button">
    <button onclick="window.location.href = ''">< ย้อนกลับ</button>
    &nbsp;
    <button onclick="window.location.href = ''">ต่อไป > </button>
</div>

<p>
    ปกติการเขียน web ด้วยภาษา java  จะมีเทคโนโลยี 2 ตัว ที่ใช้กันบ่อย  ซึ่งก็คือ  Servlet กับ  JSP <br/>
    ทั้ง 2 เทคโนโลยีนี้  เป็นการทำงานบนฝั่ง server ซึ่งจะคอยรับ request ต่างๆ ที่ client ส่งเข้ามา  และตอบ response นั้นกลับไป<br/>
</p>
<h3>Servlet</h3>
<p>
servlet  คือ java class ตัวหนึ่งที่ทำหน้าที่คอยรับ  request จาก client<br/>  จากนั้นก็ประมวลผลตาม business logic ที่วางไว้  แล้วส่ง response (ผลลัพธ์) กลับไปยัง client   
</p>    
<h3>JSP (JavaServer Page)  เป็นไฟล์ .jsp</h3>
<p>
เขียนโดยใช้  jsp tag หรือ html tag (คือเขียน html ผสมลงไปใน jsp ได้  ถ้าใครเคยเขียน  php  ก็คงจะพอเข้าใจ)  
<br/>และในไฟล์นั้นยังสามารถเขียน java code ลงไปได้    <br/>
ซึ่งไฟล์ .jsp นี้  เมื่อเขียนเส็จแล้วก็จะถูกแปลง (compile) ไปเป็น servlet (.java) ในภายหลัง   
</p>
<hr/>
<h1>ลักษณะของการ  Request  และ Response  ของ  java web application</h1>
<img src="<%= request.getServletContext().getContextPath()%>/static/image/java-web-app.png"/>

<p>
1.	Client ทำการร้องขอเพื่อใช้บริการ web page จาก web server เช่น http://localhost/helloworld.jsp<br/>
2.	Web server รับ request นั้นจาก client และส่งต่อไปยัง web container  ในระหว่างนั้นอาจจะมี filter คอยดัก request ต่างๆ  ระหว่าง web server กับตัว servlet อยู่ก็ได้<br/>
3.	Web container check ดูว่า helloworld.jsp ที่ว่ามันคือ  servlet ตัวไหน มันก็จะไปประมวลผลที่ servlet ตัวนั้น  อย่าลืมว่า hellworld.jsp จะถูกแปลงไปเป็น helloworld_jsp.java ซึ่งก็คือ servlet นั่นเอง <br/>
4.	จากนั้นก็ส่งผลลัพธ์มาให้ web server  โดยย้อนกลับมาที่ filter<br/>
5.	Web server ก็จะส่งผลลัพธ์นั้นกลับไปยัง Client อีกที<br/>
    
</p>
<h3>หมายเหตุ</h3>
<br/>
<h3>Web container (Servlet Engine)</h3>
<p>
คือ ตัวจัดการ servlet (ซึ่งคุณสมบัตินั้นจะมีอยู่เฉพาะใน web server ที่รองรับ JEE เท่านั้น) 
<br/>ทั้งสร้าง ทำลาย หรือแม้กระทั่งจัดการเรื่อง request/response ระหว่าง web server  กับ servlet   
</p>
<h3>Filter หรือ web filter</h3>
<p>
คือตัวกรอง request กับ response ว่าจะให้ทำอะไรกับ request นั้นก่อนจะถูกส่งไปประมวลผลที่ servlet   หรือหลังจากที่  return ผลลัพธ์ ออกมาจาก servlet แล้ว<br/>
ซึ่งก็ขึ้นอยู่กับ developer ว่าจะเขียน filter นั้น  ให้ทำหน้าที่อะไร  เช่น filter encoding, filter http header, filter cache control เป็นต้น
 
</p>

<%@include file="/template/footer.jsp" %>
