
# REST API สำหรับ Helpdesk
โปรแกรมนี้เป็นเกี่ยวกับ RESTful API สำหรับจัดการฐานข้อมูลของโปรเจค helpdesk support ticket management application

Demo API URL: [https://api.fordproject.tech](https://api.fordproject.tech/)

Run server เวลา 10.00 น. - 20.00 น.


## ขั้นตอนการติดตั้ง
1.  ทำการ clone โปรเจคจาก GitHub โดยใช้คำสั่งใน Command Prompt หรือ Terminal:
    ```bash
    git clone https://github.com/ford-tanya/helpdesk-api.git
    ```
> ไฟล์ `helpdesk-app.sql` ที่ได้จาก GitHub นำไป import เข้าเครื่องมือสำหรับจัดการฐานข้อมูล MySQL โดยผมใช้ phpMyAdmin สำหรับการพัฒนา

2. เข้าไปยัง directory ของโปรเจคที่ clone มาโดยใช้คำสั่งต่อไปนี้:   
	```bash
    cd helpdesk-api
    ```
    
3. ติดตั้ง packet ทั้งหมดของโปรเจค:
	```bash
    npm install
    ```
4. ทำการรัน server ด้วยคำสั่งต่อไปนี้:
	```bash
    npm start
    ```

## Packet สำหรับการพัฒนา
 1. `'cors'` เปิดใช้งาน Cross-Origin Resource Sharing (CORS)
 2. `'express'` จัดการ routing เชื่อมต่อฐานข้อมูล และการรับ-ส่ง HTTP requests และ responses
 3. `'moment'` จัดรูปแบบและแสดงผลวันที่เวลา
 4. `'mysql2'` สำหรับเชื่อมต่อ MySQL database เพื่อใช้ในการส่งคำสั่ง SQL และรับผลลัพธ์จากฐานข้อมูลได้

## ตัวอย่างการใช้งาน API

เมื่อรันโปรแกรมเซิร์ฟเวอร์จะทำงานบน port: 8000 
>ผมใช้โปรแกรม Postman สำหรับทดสอบ API ส่ง request response
1. **ฟังก์ชั่น Get Ticket**
- **หน้าที่**: ดึงข้อมูลรายการคำร้องขอทั้งหมดจากฐานข้อมูล เพื่อนำไปแสดงใน Data grid 
- **Request**:
	```bash
    method: 'GET'
    fetch: "http://localhost:8000/ticket/getTicket"
    ```
 - **Response**: **`สถานะการดึงข้อมูล`**, **`ข้อมูลรายการคำร้องขอทั้งหมด`**
 	```bash
	{
		"status": "success",
		"data": [
			{
				"ticket_id": 31,
				"title": "Audio Malfunction on Computer",
				"update_time": "2023-05-16T04:37:16.000Z",
				"status_name": "accepted"
			}
		]
	}
    ``` 
    <br/>
2. **ฟังก์ชั่น Get Ticket By Id**
- **หน้าที่**: ดึงข้อมูลคำร้องขอจากฐานข้อมูลด้วย `ticket_id` เพื่อนำไปแสดงใน Dialog
- **Request**: 
	```bash
    method: 'GET'
    fetch: "http://localhost:8000/ticket/getTicketById/20"
    ```
 - **Response**: **`สถานะการดึงข้อมูล`**, **`ข้อมูลของคำร้องขอ`** 
 `ticket_id` `title` `description` `contact` `created_time` `update_time` `update_time`
	```bash
	{
		"status": "success",
		"data": {
			"ticket_id": 20,
			"title": "Unable to Access Company Email",
			"description": "Hello, I am having trouble accessing my company email...",
			"contact": "Phone: 555-1234",
			"created_time": "2023-05-14T18:25:55.000Z",
			"update_time": "2023-05-15T10:08:41.000Z",
			"status_name": "pending"
		}
	}
    ```
    <br/>
  3. **ฟังก์ชั่น Create Ticket**
 - **หน้าที่**: นำข้อมูลคำร้องขอใหม่ลงฐานข้อมูล มีข้อมูล `title` `description` `contact` `status_id`
- **Request**: 
	```bash
    method: 'POST'
    fetch: "http://localhost:8000/ticket/createTicket"
    ```
    json body
	```bash
	{
		"title": "Software Installation Error",
		"description": "Hi, I am trying to install new software on my work computer...",
		"contact": "Phone: 555-2468",
		"status_id": 1
	}
    ```

 - **Response**: **`สถานะการบันทึกข้อมูล`**, **`ข้อมูลที่บันทึกลงฐานข้อมูล`** 
 `ticket_id` `title` `description` `contact` `created_time` `update_time` `update_time`
	```bash
	{
		"status": "success",
		"data": {
			"ticket_id": 32,
			"title": "Software Installation Error",
			"description": "Hi, I am trying to install new software on my work computer...",
			"contact": "Phone: 555-2468",
			"created_time": "2023-05-16T22:35:07+07:00",
			"update_time": "2023-05-16T22:35:07+07:00",
			"status_id": 1
		}
	}
    ```
    <br/>
  4. **ฟังก์ชั่น Update Ticket**
 - **หน้าที่**: นำข้อมูลคำร้องขอที่ต้องการแก้ไขลงฐานข้อมูล `ticket_id` `title` `description` `contact`
- **Request**: 
	```bash
    method: 'PUT'
    fetch: "http://localhost:8000/ticket/updateTicket"
    ```
    json body
	```bash
	{
		"ticket_id": 32,
		"title": "title edit",
		"description": "description edit",
		"contact": "contact edit"
	}
    ```

 - **Response**: **`สถานะการบันทึกข้อมูล`**, **`ข้อความอัพเดท`** 
	```bash
	{
		"status": "success",
		"message": "Ticket 32 updated"
	}
    ```
    <br/>
  5. **ฟังก์ชั่น Update Ticket Status**
 - **หน้าที่**: อัพเดทสถานะของคำร้องขอในฐานข้อมูล `ticket_id` `status_id`
- **Request**: 
	```bash
    method: 'PUT'
    fetch: "http://localhost:8000/ticket/updateTicketStatus"
    ```
    json body
	```bash
	{
		"ticket_id": 32,
		"status_id": 2
	}
    ```

 - **Response**: **`สถานะการอัพเดทข้อมูล`**, **`ข้อความอัพเดทสถานะ`** 
	```bash
	{
		"status": "success",
		"message": "Ticket 32 status updated to 2"
	}
    ```




