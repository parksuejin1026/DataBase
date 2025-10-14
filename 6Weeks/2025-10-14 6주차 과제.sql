# 1. 모든 회원 정보 조회
select * from usertbl;

# 2. 특정 회원(YJS)의 이름과 전화번호 조회
select userName, mobile1, mobile2 from usertbl where userId='YJS';

# 3. 1980년 이후 태어난 회원 조회
select userName from usertbl where birthYear >= 1980;

# 4. 서울에 거주하는 회원의 이름과 전화번호 조회
select userName, mobile1, mobile2 from usertbl where addr = '서울';

# 5. 2015년 이후 가입한 회원 조회
select userName from usertbl where mDate >= '2015-01-01';

# 6.구매 테이블에서 모니터를 구매한 회원의 아이디와 구매 수량 조회
select userid, amount from buytbl where prodName = '모니터';