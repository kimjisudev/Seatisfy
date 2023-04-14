CREATE TABLE `notice` (
	`nno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '공지 글 번호',
	`ntitle` VARCHAR(100) NULL DEFAULT NULL COMMENT '공지 제목' COLLATE 'utf8mb4_0900_ai_ci',
	`ncontent` LONGTEXT NULL DEFAULT NULL COMMENT '공지 내용' COLLATE 'utf8mb4_0900_ai_ci',
	`nwriter` VARCHAR(50) NULL DEFAULT NULL COMMENT '공지 작성자' COLLATE 'utf8mb4_0900_ai_ci',
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '공지 등록일',
	`modDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '공지 수정일',
	`hit` INT(10) NULL DEFAULT '0' COMMENT '조회 수',
	PRIMARY KEY (`nno`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=125
;


CREATE TABLE `post` (
	`pno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '장소 글 번호',
	`pwriter` VARCHAR(100) NULL DEFAULT NULL COMMENT '작성자' COLLATE 'utf8mb4_0900_ai_ci',
	`ptitle` VARCHAR(200) NULL DEFAULT NULL COMMENT '제목' COLLATE 'utf8mb4_0900_ai_ci',
	`pcontent` LONGTEXT NULL DEFAULT NULL COMMENT '내용' COLLATE 'utf8mb4_0900_ai_ci',
	`place` VARCHAR(200) NULL DEFAULT NULL COMMENT '장소' COLLATE 'utf8mb4_0900_ai_ci',
	`address` VARCHAR(200) NULL DEFAULT NULL COMMENT '주소' COLLATE 'utf8mb4_0900_ai_ci',
	`seatinfo` VARCHAR(2000) NULL DEFAULT NULL COMMENT '좌석 배치 정보' COLLATE 'utf8mb4_0900_ai_ci',
	`startdate` VARCHAR(50) NULL DEFAULT NULL COMMENT '예약 시작일' COLLATE 'utf8mb4_0900_ai_ci',
	`enddate` VARCHAR(50) NULL DEFAULT NULL COMMENT '예약 마감일' COLLATE 'utf8mb4_0900_ai_ci',
	`regdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '글 작성일',
	`moddate` VARCHAR(50) NULL DEFAULT NULL COMMENT '글 수정일' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`pno`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


CREATE TABLE `qna` (
	`qno` INT(10) NOT NULL AUTO_INCREMENT,
	`qtitle` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`qcontent` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`qdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`qno`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


CREATE TABLE `seat` (
	`sno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '좌석id',
	`seatnum` INT(10) NULL DEFAULT NULL COMMENT '좌석 번호',
	`pno` INT(10) NULL DEFAULT NULL COMMENT '예약 글 번호',
	`isreserved` VARCHAR(50) NULL DEFAULT 0 COMMENT '예약 여부' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`sno`) USING BTREE,
	INDEX `FK_seat_post` (`pno`) USING BTREE,
	CONSTRAINT `FK_seat_post` FOREIGN KEY (`pno`) REFERENCES `post` (`pno`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


CREATE TABLE `user` (
	`uno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
	`username` VARCHAR(50) NULL DEFAULT NULL COMMENT '이메일 형식 아이디' COLLATE 'utf8mb4_0900_ai_ci',
	`password` VARCHAR(500) NULL DEFAULT NULL COMMENT '비밀번호' COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(50) NULL DEFAULT NULL COMMENT '이름(본명)' COLLATE 'utf8mb4_0900_ai_ci',
	`phone` VARCHAR(50) NULL DEFAULT NULL COMMENT '전화번호' COLLATE 'utf8mb4_0900_ai_ci',
	`authority` VARCHAR(50) NULL DEFAULT 'ROLE_USER' COMMENT '권한' COLLATE 'utf8mb4_0900_ai_ci',
	`udate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일',
	`enabled` INT(10) NULL DEFAULT '1',
	PRIMARY KEY (`uno`) USING BTREE,
	UNIQUE INDEX `username` (`username`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=5
;


CREATE TABLE `reservation` (
	`rno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '예약 번호',
	`pno` INT(10) NULL DEFAULT NULL COMMENT '장소 글 번호',
	`seatnum` INT(10) NULL DEFAULT NULL COMMENT '좌석 번호',
	`email` VARCHAR(50) NULL DEFAULT NULL COMMENT '이메일 형식 아이디',
	`rdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '예약한 날짜',
	PRIMARY KEY (`rno`) USING BTREE,
	INDEX `FK_reservation_post` (`pno`) USING BTREE,
	CONSTRAINT `FK_reservation_post` FOREIGN KEY (`pno`) REFERENCES `post` (`pno`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

CREATE TABLE `reply` (
	`rno` INT(10) NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
	`pno` INT(10) NULL DEFAULT NULL COMMENT '예약 글 번호',
	`rcontent` VARCHAR(50) NULL DEFAULT NULL COMMENT '댓글 내용' COLLATE 'utf8mb4_0900_ai_ci',
	`rwriter` VARCHAR(50) NULL DEFAULT NULL COMMENT '댓글 작성자' COLLATE 'utf8mb4_0900_ai_ci',
	`regDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
	`modDate` VARCHAR(50) NULL DEFAULT NULL COMMENT '수정일자' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`rno`) USING BTREE,
	INDEX `FK_reply_post` (`pno`) USING BTREE,
	CONSTRAINT `FK_reply_post` FOREIGN KEY (`pno`) REFERENCES `post` (`pno`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;