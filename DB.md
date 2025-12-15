## 📝 데이터베이스(DB) 문제 풀이 PDF 분석 결과

### 1. 챕터 요약 정리

#### 📘 CHAPTER 02 데이터베이스 전체 운영 맛보기 (P. 3, 4)

* **정보 시스템 구축 단계**: 분석-설계-구현-시험-유지·보수 (5단계)
* **데이터베이스 모델링**: 현실 세계 데이터를 MySQL에 옮기는 과정.
* **핵심 용어**: 데이터, 테이블, 데이터베이스, DBMS, 열(필드), 행(레코드), 기본키, 외래키, SQL 등.
* **DB 구축 및 관리 절차**: DBMS 설치 → 데이터베이스 생성 → 테이블 생성 → 데이터 입력 → 데이터 조회 및 활용 → 응용 프로그램 활용 → 데이터 백업 및 관리.
* **MySQL 용어**: 스키마(Schema)와 데이터베이스(Database)는 동일하게 사용됨.
* **SQL 문**:
    * 데이터 입력: INSERT 문, 삭제: DELETE 문.
    * 검색 기본 형식: 'SELECT 열이름 FROM 테이블이름 WHERE 조건'
* **MySQL Workbench**: 특정 SQL 문 실행은 드래그 후 Ctrl + Shift + Enter.
* **데이터베이스 개체**:
    * **인덱스(Index)**: 데이터 검색 속도 향상.
    * **뷰(View)**: 가상의 테이블(SELECT 문), 보안에 유리.
    * **스토어드 프로시저(Stored Procedure)**: MySQL 프로그래밍 기능.
    * **트리거(Trigger)**: 테이블에 부착되어 특정 작업(INSERT/UPDATE/DELETE) 발생 시 실행되는 코드.

#### 📘 CHAPTER 05 데이터 검색과 그루핑 (P. 8, 10)

* **SQL 표준**: ANSI-92 SQL, ANSI-99 SQL. (MySQL은 그냥 SQL)
* **SELECT 문 구문 순서 (주요 절)**: SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY
* **USE 문**: 현재 사용할 데이터베이스 지정/변경.
* **별칭**: 열 이름 뒤에 AS 별칭.
* **WHERE 절**: 조건 검색.
    * 연속적인 값: `BETWEEN... AND`
    * 이산적인 값: `IN()`
    * 문자열 검색: `LIKE` 연산자.
* **서브쿼리**: 쿼리문 안에 또 다른 쿼리문.
    * `ANY`: 서브쿼리 결과 중 하나만 충족.
    * `ALL`: 서브쿼리 결과를 모두 충족.
* **ORDER BY 절**: 출력 순서 조절 (결과에는 영향 없음).
* **DISTINCT**: 중복된 행을 하나만 출력.
* **LIMIT N**: 결과 중 상위 N개만 출력.
* **GROUP BY 절**: 결과 행을 그룹으로 묶음.
* **집계 함수**: SUM(), AVG(), MIN(), MAX(), COUNT() 등.
* **HAVING 절**: **집계 함수에 대해서만** 조건 제한.
* **WITH ROLLUP**: 총합 또는 중간 합계를 구하는 기능.

#### 📘 CHAPTER 08 조인과 SQL 프로그래밍 (P. 18)

* **조인(JOIN)**: 2개 이상 테이블을 묶어 하나의 결과 테이블 생성.
* **내부 조인 (INNER JOIN)**: 조인 조건을 충족하는 행만 출력 (가장 많이 사용).
* **외부 조인 (OUTER JOIN)**: 조인 조건을 충족하지 않는 행까지 포함하여 출력 (LEFT/RIGHT).
* **상호 조인 (CROSS JOIN)**: 모든 행끼리 조인.
* **자체 조인 (SELF JOIN)**: 자기 자신과 조인.
* **UNION**: 두 쿼리 결과를 **행으로 합침** (중복 제거 후 정렬).
* **UNION ALL**: 두 쿼리 결과를 행으로 합침 (중복 포함).
* **SQL 프로그래밍**: `IF... ELSE...`, `CASE`, `WHILE` 등을 사용.
* **동적 SQL**: `PREPARE` (준비), `EXECUTE` (실행).

#### 📘 CHAPTER 09 테이블과 뷰 (P. 27, 28, 32)

* **테이블**: 행과 열로 구성.
* **제약 조건 (무결성 보장)**: PRIMARY KEY, FOREIGN KEY, UNIQUE, DEFAULT, NULL/NOT NULL, CHECK.
* **기본키 (PRIMARY KEY)**: 행을 구분하는 식별자. 중복 불가, NULL 불가. 테이블당 하나만 존재.
* **외래키 (FOREIGN KEY)**: 테이블 간 관계 선언. 참조 대상은 기본키 또는 UNIQUE여야 함.
    * `ON DELETE/UPDATE CASCADE`: 기준 테이블 변경 시 외래키 테이블에 자동 적용.
* **UNIQUE**: 중복 불가, **NULL 값은 허용** (기본키와 차이점).
* **DEFAULT**: 값 입력 안 했을 때 자동으로 입력되는 값 정의.
* **NULL/NOT NULL**: `NULL`은 값 허용, `NOT NULL`은 필수 입력.
* **임시 테이블 (TEMPORARY TABLE)**: `DROP TABLE`이나 Workbench 종료 시 제거됨.
* **테이블 수정**: `ALTER TABLE` 문 사용.
* **뷰 (VIEW)**: 가상의 테이블 (실체는 SELECT 문). 보안 및 복잡한 쿼리 단순화에 사용. MySQL 서비스 재시작되어도 제거되지 않음.
    * `WITH CHECK OPTION`: 뷰 생성 시 사용된 WHERE 조건을 만족하는 데이터만 삽입/수정 가능하도록 제약.

#### 📘 CHAPTER 10 인덱스 (P. 21, 22, 24)

* **인덱스**: SELECT 문 검색 속도 향상에 도움.
* **장점**: 검색 속도 향상, 쿼리 부하 감소.
* **단점**: 인덱스 저장 공간 필요 (데이터베이스 크기의 약 10% 추가), 데이터 변경(삽입/수정/삭제) 시 성능 저하 (**페이지 분할** 발생).
* **인덱스 종류 (MySQL)**: 클러스터형 인덱스, 보조 인덱스.
    * **클러스터형 인덱스**: **PRIMARY KEY** 설정 시 자동 생성. **데이터 페이지 전체가 정렬**되며, 테이블당 **하나만** 생성 가능. (리프 페이지가 곧 데이터 페이지)
    * **보조 인덱스**: **UNIQUE 제약 조건** 설정 및 `CREATE INDEX`로 생성. 별도 페이지에 인덱스 구성. 테이블당 **여러 개** 생성 가능. (리프 페이지에 주솟값 저장)
* **내부 구조**: **B-Tree** 구조.
* **인덱스 생성 판단 기준**:
    * **WHERE 절**에서 자주 사용되는 열.
    * 데이터 중복도가 **낮은** 열.
    * **외래키** 설정 열 (자동 생성).
    * **조인**에 자주 사용되는 열.
    * 데이터 변경 작업 빈도를 고려.

### 2. 연습 문제 풀이

| 챕터 | 번호 | 문제 유형 | 정답 및 풀이 요약 |
| :--- | :--- | :--- | :--- |
| **02** | 1-①~④ | 핵심 용어 | 데이터 형식, SQL, 데이터베이스, 열 이름 |
| **02** | 2 | 순서 배열 | 데이터베이스 생성 → 테이블 생성 → 데이터 입력 → 데이터 조회 |
| **02** | 3 | 상식 | 3306 (MySQL 기본 포트) |
| **02** | 4 | Workbench | ④ Administration 탭은 서버 관리, DB 생성/수정/삭제는 Schemas 탭이나 SQL 쿼리 창에서 수행. |
| **02** | 5 | DB 생성 | ④ [Apply]를 두 번 클릭하는 것은 불필요. |
| **02** | 6 | 데이터 형식 | ① char (문자열 형식) |
| **02** | 7 | 데이터 수정 | ④ 마우스 우클릭으로 [Update Row(s)]가 아니라 셀을 더블클릭 후 [Apply] 클릭. |
| **02** | 8 | SQL 실행 | ① 더블클릭은 실행 방법이 아님. |
| **02** | 9 | SQL 명령 | ③ `DROP TABLE \`Cook Table\`` (테이블 삭제) |
| **02** | 10 | 인덱스 | ④ 인덱스 이름은 반드시 `idx`로 시작해야 한다는 규칙은 없음. |
| **02** | 11 | SQL 오류 | 4행 (SELECT 뒤에 열 이름/와일드카드(*) 누락) |
| **02** | 12 | SQL 빈칸 | 테이블이름 (`AFTER DELETE ON **테이블이름**`) |
| **05** | 1 | SQL 종류 | ④ PL/SQL은 오라클에서 사용. MySQL은 그냥 SQL. |
| **05** | 2 | 순서 배열 | SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY |
| **05** | 3 | USE 문 | ③ 데이터베이스를 사용한다. |
| **05** | 4 | Workbench 설정 | ④ 테이블의 행을 끝까지 모두 출력한다. |
| **05** | 5 | SQL 실행 | ②, ⑥ (주석 처리 안 된 유효하지 않은 SQL 문) |
| **05** | 6 | 순서 배열 | SHOW DATABASES → USE DB이름 → SHOW TABLES → DESC 테이블이름 |
| **05** | 7 | 별칭 | ④ 열이름 AS "별칭" (MySQL은 기본적으로 큰따옴표가 문자열 상수를 나타냄) |
| **05** | 8 | SQL 오류 | 2행: `NOT NULL PRIMARY KEY`로 수정. 9행: 마지막 콤마 제거. |
| **05** | 9 | 데이터 형식 | ④ MySQL에서 CHAR와 NCHAR는 동일하지 않음. |
| **05** | 11-① | SQL 작성 | `WHERE height BETWEEN 170 AND 180` |
| **05** | 11-② | SQL 작성 | `WHERE addr IN ('서울', '경기')` |
| **05** | 11-③ | SQL 작성 | `WHERE userName LIKE '김%' OR userName LIKE '신%'` |
| **05** | 11-④ | SQL 작성 | `WHERE addr = (SELECT addr FROM userTBL WHERE userName = '신동엽')` |
| **05** | 11-⑤ | SQL 작성 | `ORDER BY addr, height DESC` |
| **05** | 11-⑥ | SQL 작성 | `ORDER BY userName LIMIT 2, 4` |
| **05** | 11-⑦ | SQL 작성 | `CREATE TABLE newTable (SELECT userName, mDate FROM userTBL WHERE height >= 179)` |
| **05** | 11-⑧ | SQL 작성 | `SELECT COUNT(*), AVG(price) FROM buyTBL` |
| **05** | 11-⑨ | SQL 작성 | `GROUP BY userID HAVING SUM(amount) >= 5` |
| **09** | 1 | SQL 오류 | 4행: `birthYear INT NOT NULL` (TINYINT 크기 오류). 9행: 마지막 콤마 제거. |
| **09** | 2 | SQL 빈칸 | **빈칸 1**: `AUTO_INCREMENT`, **빈칸 2**: `REFERENCES`, **빈칸 3**: `NULL` |
| **09** | 3 | 제약 조건 | ② UNION 제약 조건, ④ SQL 제약 조건 (존재하지 않음) |
| **09** | 4 | SQL 빈칸 | `CONSTRAINT PRIMARY KEY` |
| **09** | 5 | SQL 빈칸 | `ADD CONSTRAINT` |
| **09** | 6 | 외래키 옵션 | ① ON UPDATE CASCADE |
| **09** | 7 | 기본값 | ④ DEFAULT |
| **09** | 8 | NULL | ④ NULL은 공백이나 0을 의미하지 않음. |
| **09** | 9 | SQL 빈칸 | `ROW_FORMAT=COMPRESSED` |
| **09** | 10 | 임시 테이블 | ③ 새 SQL 창을 열때 (제거되지 않음) |
| **09** | 11-①~④| 테이블 수정 | ① `ADD COLUMN` (또는 `ADD`), ② `DROP COLUMN` (또는 `DROP`), ③ `CHANGE COLUMN`, ④ `DROP` |
| **09** | 12 | 뷰 | ③ 뷰는 서비스 재시작되어도 제거되지 않음. ④ 모든 뷰가 수정 불가능한 것은 아님. |
| **09** | 13 | 뷰 오류 | `WITH CHECK OPTION` 조건(`birthYear >= 1970`)을 만족하지 않는 1960년생 데이터 삽입 시도. |
| **10** | 1 | 인덱스 | ④ 무조건 검색 속도가 빨라지지는 않음. ⑤ 전체 시스템 성능에 영향. ⑥ 인덱스 생성 시 저장 공간 추가 필요. |
| **10** | 2 | 자동 생성 | ① Primary Key, ② Foreign Key, ③ Unique Key |
| **10** | 3 | 클러스터형/보조 | ④ PRIMARY KEY와 UNIQUE NOT NULL이 같이 있으면 PRIMARY KEY에 우선 클러스터형 인덱스 생성. |
| **10** | 4 | 인덱스 트리 | ③ Balanced Tree (B-Tree 구조) |
| **10** | 5 | 용어 | 페이지 분할 (데이터 삽입 시 성능 저하의 주요 원인) |
| **10** | 7 | 클러스터형 | ③ 데이터 변경 속도는 느림. ⑤ 인덱스와 데이터 저장 공간이 분리되어 있지 않음. |
| **10** | 8 | UNIQUE 오류 | `addr` 열에 중복된 값이 존재하기 때문 (UNIQUE INDEX는 중복된 값을 허용하지 않음). |
| **10** | 9 | 인덱스 삭제 | ③ 보조 인덱스부터 삭제할 필요 없음. ⑤ 기본키 인덱스는 `DROP INDEX`로 삭제 불가. |
| **10** | 10 | 판단 기준 | ③ 외래키 설정 열은 자동 생성. ⑦ 데이터 변경 작업 빈도를 고려해야 함. |
