# CHAPTER 08 조인과 SQL 프로그래밍 25.11.18 (화)

# KYM이라는 아이디를 가진 회원이 구매한 물건을 발송하는 방법
use cookdb;
select *
	from buytbl
	 inner join usertbl
      on buytbl.userID = usertbl.userID
    where buytbl.userID = 'KYM';
    
# 아이디, 이름, 구매 물품, 주소, 연락처만 추출
select userID, userName, prodName, addr, concat(mobile1, mobile2) as '연락처'
	from buytbl
		inner join usertbl
			on buytbl.userID = usertbl.userID; # 이렇게 하면 error 뜸 userID에 어떤 테이블을 쓰는 지 명확히 해줘야됨
# 변경
select usertbl.userID, userName, prodName, addr, concat(mobile1, mobile2) as '연락처'
	from buytbl
		inner join usertbl
			on buytbl.userID = usertbl.userID; 
# alias 별명을 사용하여 간단히 작성하는 방법
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from buytbl B
		inner join usertbl U
			on B.userID = U.userID;
# KYM이라는 아이디를 가진 회원이 구매한 물건과 회원 정보 조인(아이디, 이름, 물품, 주소, 연락처만 출력되게 하고 코드도 간결하게 수정하기)
select B.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from buytbl B
		inner join usertbl U
			on B.userID = U.userID
	where B.userID = 'KYM';
    
# 회원 테이블(userTBL)을 기준으로 KYM이 구매한 물건의 목록 조회
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from usertbl U
		inner join buytbl B
			on U.userID =B.userID
	where B.userID = 'KYM';

# 전체 회원이 구매한 목록 모두  출력(회원 아이디 순으로 정렬)
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from usertbl U
		inner join buytbl B
			on U.userID = B.userID
	order by U.userID;

# 쇼핑몰에서 한 번이라도 구매한 기록이 있는 우수 회원에게 감사의 안내문을 발송할 때 (distinct 키워드 활용)
select distinct U.userID, U.userName, U.addr
	from usertbl U
		inner join buytbl B
			on U.userId = B.userID
	order by U.userID;
    
# exists 구문을 사용해서 앞과 동일한 결과 만들기
select U.userID, U.userName, U.addr
	from usertbl U
	where exists(
		select *
        from buytbl B
        where U.userID = B.userID);