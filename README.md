# 📚 2025-DataBase: SQL로 시작하는 데이터베이스 입문 과정 🚀

[![GitHub stars](https://img.shields.io/github/stars/parksuejin1026/2025-DataBase?style=social)](https://github.com/YOUR_GITHUB_USERNAME/2025-DataBase/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/parksuejin1026/2025-DataBase?style=social)](https://github.com/YOUR_GITHUB_USERNAME/2025-DataBase/network/members)

> **"데이터를 이해하고 관리하는 힘, SQL과 데이터베이스 기초부터 탄탄하게!"**

## 💡 과정 소개 및 학습 목표

본 과정은 데이터베이스(DB)와 SQL(Structured Query Language)의 기본 개념을 이해하고, **MySQL Workbench**와 같은 도구를 활용하여 실제 데이터베이스를 구축하고 운영하는 실무 능력을 기르는 데 중점을 둡니다.

### 주요 목표

* [cite_start]데이터베이스와 DBMS의 핵심 개념을 명확히 이해합니다[cite: 2525].
* [cite_start]데이터베이스 모델링의 중요성과 단계를 이해하고 실습합니다[cite: 12, 55, 57, 59].
* [cite_start]MySQL Workbench의 다양한 기능(SQL 편집, 서버 관리 등)을 능숙하게 활용합니다[cite: 660, 669, 670].
* [cite_start]SQL 기본 구문(SELECT, WHERE, GROUP BY 등)을 익혀 데이터를 검색하고 조작하는 능력을 배양합니다[cite: 4571, 4574].
* [cite_start]데이터베이스 관리의 핵심 요소인 사용자 권한, 백업 및 복원 방법을 실습합니다[cite: 661, 662, 2264].

---

## 📖 상세 커리큘럼 (무엇을 배우나요?)

| Part | 주요 주제 | 세부 학습 내용 | 참고 사항 |
| :---: | :--- | :--- | :--- |
| **Part 1** | **데이터베이스와 MySQL 설치** | [cite_start]**데이터베이스/DBMS 개요** (정의, 특징, DBMS 분류-관계형 DBMS 중심 [cite: 2532, 2535, 2595][cite_start]), **SQL의 특징** [cite: 2624, 2625][cite_start], **MySQL 설치 및 설정** (Community Edition [cite: 2654, 2760][cite_start], Workbench 기본 사용법 [cite: 664]) | [cite_start]DBMS는 데이터를 관리·운영하는 소프트웨어입니다[cite: 2535]. [cite_start]관계형 DBMS는 테이블에 모든 데이터를 저장합니다[cite: 2596]. |
| **Part 2** | **DB 구축 및 기본 운영** | [cite_start]**데이터베이스 구축 절차** (모델링-구축-활용-백업/관리 [cite: 3598, 3606][cite_start]), **필수 용어** (테이블, 열/행, 기본키(PK), 외래키(FK), SQL [cite: 3584, 3594][cite_start]), **DB/테이블 생성** (MySQL Workbench 실습 [cite: 3722, 3822]) | [cite_start]테이블의 각 행을 구분하는 유일한 열이 **기본키(PK)**입니다[cite: 3593]. |
| **Part 3** | **데이터베이스 모델링** | [cite_start]**모델링 개념 및 절차** (현실 세계를 DBMS 개체로 옮기는 과정 [cite: 38, 39, 54][cite_start]), **폭포수 모델**의 분석과 설계 단계의 중요성 [cite: 27][cite_start], **모델링 3단계** (개념적, 논리적, 물리적 모델링 [cite: 55, 57, 59][cite_start]), **쇼핑몰 DB 모델링 실습** [cite: 62, 107, 127] | [cite_start]폭포수 모델에서 DB 모델링은 분석과 설계 단계의 가장 중요한 작업입니다[cite: 28]. |
| **Part 4** | **데이터 검색과 그루핑** | [cite_start]**SELECT 기본 구문** (모든 열 검색: `*` [cite: 4624][cite_start], 원하는 열만 검색 [cite: 4730][cite_start]), **WHERE 절** (조건 검색, 연산자 활용 [cite: 5008, 5009][cite_start]), **ORDER BY** (정렬: 오름차순/내림차순 [cite: 5077, 5079][cite_start]), **GROUP BY** (그룹별 집계 [cite: 5278][cite_start]), **HAVING** (그룹 결과 필터링 [cite: 5341][cite_start]), **집계 함수** (SUM, AVG, MIN, MAX, COUNT 등 [cite: 5291]) | [cite_start]`GROUP BY`와 함께 집계 함수를 사용하여 그룹별 통계를 낼 수 있습니다[cite: 5278]. |
| **Part 5** | **고급 DB 개체 활용** | [cite_start]**인덱스(Index)** (개념, 성능 향상 원리 [cite: 4231, 4233, 4338][cite_start]), **뷰(View)** (가상 테이블, 보안 목적 활용 [cite: 4341, 4342][cite_start]), **스토어드 프로시저** (SQL 문 묶어 사용 [cite: 4385, 4386][cite_start]), **트리거(Trigger)** (테이블에 부착되어 자동 실행되는 코드 [cite: 4457, 4459]) | [cite_start]인덱스는 책의 **찾아보기**와 같아 검색 성능을 높여줍니다[cite: 4233, 4338]. |
| **Part 6** | **DB 관리 및 운영** | [cite_start]**MySQL Workbench 기능** (내비게이터 기능, SQL 문 자동 생성 [cite: 849, 899, 903][cite_start]), **사용자 및 권한 관리** (User 생성 및 권한 부여/확인 [cite: 661, 1864, 1887][cite_start]), **데이터 백업과 복원** (DBA의 중요 업무 [cite: 2264][cite_start], Workbench 활용 실습 [cite: 673, 2299, 2427]) | [cite_start]백업은 데이터를 다른 매체에 보관하는 작업이고, 복원은 문제가 생겼을 때 원상태로 돌려놓는 작업입니다[cite: 2266, 2268]. |

---

## 🛠️ 실습 환경 및 도구

* [cite_start]**DBMS:** MySQL Community Server 8.0 [cite: 2654]
* [cite_start]**GUI 툴:** MySQL Workbench 8.0 CE (GUI 지원 통합 관리 툴) [cite: 670, 2662]
* **언어:** SQL (Structured Query Language)

> **⚠️ 참고:** 위의 `YOUR_GITHUB_USERNAME` 부분을 실제 깃허브 사용자 이름으로 변경해 주세요.
