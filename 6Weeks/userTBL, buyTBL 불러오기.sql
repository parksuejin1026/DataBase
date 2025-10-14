use cookDB;
select * from userTBL;
select * from buyTBL;

select * from userTBL where  userName = '강호동'; # userTBL에서 강호동의 정보만 조회
select userID,userName from userTBL where birthYear >= 1970 and height >= 182; # 회원 테이블에서 1970년 이후에 출생했고 키가 182cm 이상인 사람의 아이디와 이름을 조회
select userID,userName from userTBL where birthYear >= 1970 or height >= 182; # 1970년 이후에 출생했거나 키가 182cm 이상인 사람의 아이디와 이름 조회

# 회원 테이블에서 키가 180~182cm인 사람 조회
select userName, height from userTBL where height >= 180 and height <= 182; 
select userName, height from userTBl where height between 180 and 182; # 이러한 방법도 가능!
# 주소가 경남, 충남, 경북 사람의 이름과 주소를 or 연산자를 사용하여 조회 
select userName, addr from userTBL where addr='경남' or addr='충남' or addr='경북';
# 이산적인 값을 조회할 때는 in() 연산자를 사용한다.
select userName, addr from userTBL where addr in ('경남','충남','경북');
# 성이 김 씨인 회원의 이름과 키를 조회
select userName,height from userTBL where userName like '김%';
# 맨 앞의 한 글자가 무엇이든 상관없고 그다음이 '경규'인 사람 조회
select userName, hright from userTBL where userName like '_경규';
# 김용만보다 키가 크거나 같은 사람의 이름과 키 출력
select userName, height from userTBL where height > 177;
select userName, height from userTBL where height > (select height from userTBL where userName = '김용만');
# 지역이 경기인 사람보다 키가 크거나 같은 사람 추출
select userName, height from userTBL where height >= (select height from userTBL where addr = '경기');
