CREATE TABLE users(
	num NUMBER PRIMARY KEY, -- 회원의 고유번호
	userName VARCHAR2(20) UNIQUE, -- 아이디
	password VARCHAR2(100) NOT NULL, -- 비밀번호
	email VARCHAR2(100), -- 이메일
	profileImage VARCHAR2(100), -- 프로필 이미지 정보
	role VARCHAR2(10) DEFAULT 'ROLE_USER', -- 역활 USER(일반사용자) | STAFF(직원) | ADMIN(최고권한관리자)
	updatedAt DATE,
	createdAt DATE
);

CREATE SEQUENCE users_seq;

CREATE TABLE member(
	num NUMBER PRIMARY KEY,
	name VARCHAR2(20),
	addr VARCHAR2(20)
);

CREATE SEQUENCE member_seq;

CREATE SEQUENCE book_seq;

CREATE TABLE BOOK (
    num NUMBER PRIMARY KEY,            
    title VARCHAR2(200) NOT NULL,         
    author VARCHAR2(100),                 
    publisher VARCHAR2(100)                   
);