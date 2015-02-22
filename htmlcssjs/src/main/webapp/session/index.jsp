<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<h1>Session</h1>
<div class="prev-next-button">
    <button onclick="window.location.href = ''">< ย้อนกลับ</button>
    &nbsp;
    <button onclick="window.location.href = ''">ต่อไป > </button>
</div>

<p>
<h1>Stateful vs Sateless</h1>
<br/>
<strong>Stateful</strong> หมายถึง การจดจำสถานะ (state)<br/>
<strong>Stateless</strong>  หมายถึง การไม่จดจำสถานะ (state)<br/>
</p>
<p>

        HTTP (HyperText Transfer Protocol) เป็น Protocol ที่ใช้ในการสื่อสาร / รับส่งข้อมูลทางด้าน Web Application<br/>
        การทำงานของ HTTP จะเป็นการสร้างแล้วส่ง Request ไปยัง Web Server เพื่อร้องขอ Resources<br/> 
เมื่อ Web Server ได้รับ Request  ก็จะทำการตรวจสอบสิทธิ์ว่า Request นั้นมีสิทธิ์เข้าถึง Resource ดังกล่าวหรือไม่ หากมีสิทธิ์ Web Server ก็จะจัดสรร Resource ให้ตามที่ Request นั้นร้องขอมา <br/>
<br/>

        HTTP เป็น Protocol ที่ไม่มีการจดจำสถานะการทำงาน  ทุกครั้งที่ Request ไป จะเป็นการสร้าง Request ขึ้นมาใหม่  โดยไม่มีการจัดเก็บ / จดจำข้อมูลใดๆ ไว้ที่ Web Server<br/>
        ทุก Request ที่ส่งไป จะถูก Web Server ตรวจสอบสิทธิ์ใหม่ทุกครั้ง  เราเรียกการทำงานของ HTTP ว่าเป็นการทำงานแบบ <h1 style="margin-top: 10px; border: none;">"Stateless"</h1>   
<br/>
<br/>
        จากปัญหาดังกล่าว  เขาจึงได้คิดค้นวิธีการที่ทำให้ Web Server สามารถจดจำสถานะการทำงาน  หรือสถานะของ Client ได้โดยไม่จำเป็นต้องตรวจสอบสิทธิ์ใหม่ทุกครั้ง  
        <br/>วิธีการที่นำมาใช้เรียกว่า Session 
<br/>
<br/>
<h3>Session</h3>
        Session เป็นวิธีการที่ Web Server ใช้สำหรับจดจำสถานะการทำงาน / ระบุตัวตนของ Client<br/>
เมื่อ Client ทำการ Log in เข้าสู่ระบบ Web Server จะสร้างรหัสชุดนึงขึ้นมา เรียกว่า Session Id  แล้วทำการส่ง Session Id กลับไปพร้อมกับ Request ของ Client <br/><br/>

        Client จะเก็บ Session Id ไว้ในรูปแบบที่เรียกว่า Cookies <br/>
        เมื่อมีการส่ง HTTP Request ไปยัง Web Server อีกครั้ง  Client จะต้องส่ง Session Id กลับไปให้ Web Server ด้วย <br/> เพื่อบอกกับ Web Server ว่า ตนเคย Log in เข้ามาในระบบแล้ว  (ด้วย Session Id ดังกล่าว) จะได้ไม่ต้องตรวจสอบสิทธิ์ใหม่อีกครั้ง 
        <br/>เราเรียกการทำงานแบบนี้ว่า <h1 style="margin-top: 10px; border: none;">"Stateful"</h1>

        ปัจจุบัน  มี  Application ที่ทำงานทั้งที่เป็นแบบ Stateful และ Stateless<br/>
Stateful คือ Application ที่ใช้ Session<br/>
Stateless คือ Application ที่ไม่ใช้ Session  แต่จะใช้อย่างอื่นแทน  ที่เรียกว่า Token<br/>
    
</p>

<%@include file="/template/footer.jsp" %>
