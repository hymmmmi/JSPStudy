USE goodsDB;

-- 상품목록 테이블

CREATE TABLE IF NOT EXISTS items ( 

   i_id 		VARCHAR(10) NOT NULL, 	
   i_name 		VARCHAR(20),   			
   i_unitPrice  			INTEGER,  	
   i_description 			TEXT,      
   i_size  	  	VARCHAR(10),  			
   i_category   VARCHAR(10),   			
   i_unitsInStock 			LONG,   	
   i_fileName   VARCHAR(20), 		
   PRIMARY KEY (i_id)					
   
)default CHARSET=utf8;

desc items;

drop table items ; 
-- 상품목록 테이블 삭제


INSERT INTO items VALUES ('2025-01', '25홈유니폼', '109000', '2025년 홈그라운드 유니폼입니다', 'M, L, XL', 'Home', '10', '25HOME.jpg');
INSERT INTO items VALUES ('2025-02', '25원정유니폼', '109000', '2025년 원정 유니폼입니다', 'M, L, XL', 'Aways', '10', '25AWAYS.jpg');
INSERT INTO items VALUES ('2025-03', '25싸인볼', '20000', '2025년 싸인볼입니다', 'FREE', 'Acc', '10', '25Ball.jpg');
INSERT INTO items VALUES ('2025-04', '25마스코트키링', '15000', '2025년 수원블루윙즈 마스코트 키링입니다', 'FREE', 'Acc', '10', '25Keyring.jpg');
INSERT INTO items VALUES ('2025-05', '25머플러', '20000', '2025년 수원블루윙즈 니트 머플러입니다', 'FREE', 'Acc', '10', '25Muffler.jpg');

select * from items;
