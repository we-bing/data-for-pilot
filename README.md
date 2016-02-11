# data-for-webing-pilot

  
 이 저장소에 있는 데이터는 [팀포퐁](http://popong.com/), [중앙선거관리위원회](http://www.nec.go.kr), [국회 의안정보시스템](http://likms.assembly.go.kr/bill/), [열려라 국회](http://watch.peoplepower21.org/) 그리고 다음과 네이버의 오픈 API를 이용해서 수집하였습니다.
 
어떤 목적으로든 이 데이터를 사용하실 수 있습니다.

다만 데이터를 활용하실 때, CCC 라이선스에 의하여 데이터 출처를 위에 나열한 출처들과 저희 위빙을 함께 명시해야 합니다.

기타 문의사항 또는 오류 제보는 이슈제기를 통해서 해주시길 바랍니다. 

--------
## 테이블들 
>사용되는 테이블들에 대한 대략적인 설명과 출처

<table>
<thead>
    <tr>
        <th>Table Name</th>
        <th>Description</th>
        <th>Source</th>
        <th>Created date</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>TB_CANDIDACIES</th>
        <td>20대 국회의원 선거 후보자 데이터</td>
        <td>국회 의안정보시스템, 팀포퐁</td>
        <td>2016-02-10</td>
    </tr>
    <tr>
        <th>TB_POPONG19</th>
        <td>지난 19대 국회의원 정보</td>
        <td>팀포퐁</td>
        <td>2016-02-10</td>
    </tr>
    <tr>
        <th>TB_MEMBER_REPORT</th>
        <td>지난 19대 국회의원 국회 활동 정보</td>
        <td>열려라 국회</td>
        <td>2016-02-10</td>
    </tr>
    <tr>
        <th>TB_CANDIDACY_KEYWORDS</th>
        <td>후보자별 검색 대표 키워드</td>
        <td>네이버/다음 검색 API</td>
        <td>2016-02-10</td>
    </tr>
    <tr>
        <th>TB_KEYWORD_NEWS</th>
        <td>키워드별 뉴스 정보</td>
        <td>네이버/다음 뉴스 API</td>
        <td>2016-02-10</td>
    </tr>
    <tr>
        <th>CODE_CITY</th>
        <td>시/도 정보</td>
        <td>중앙선거관리위원회</td>
        <td>2016-02-11</td>
    </tr>
    <tr>
        <th>CODE_COUNTY</th>
        <td>구/시/군 정보</td>
        <td>중앙선거관리위원회</td>
        <td>2016-02-11</td>
    </tr>
    <tr>
        <th>CODE_TOWNSHIP</th>
        <td>읍/면/동 별 선거구 정보</td>
        <td>중앙선거관리위원회</td>
        <td>2016-02-11</td>
    </tr>
    <tr>
</tbody>
</table>


---------


### TB_CANDIDACIES


person_ID는 was_elected 값이 T인 후보자만 유효하며 TB_POPONG_19의 person_id 값을 참조한다.

<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>candidacy_id</th>
        <td>후보 등록 번호</td>
        <td>191919</td>
    </tr>
    <tr>
        <th>was_elected</th>
        <td>팀포퐁의 Person Id</td>
        <td>T or F</td>
    </tr>
    <tr>
        <th>birthday</th>
        <td>후보자의 생일</td>
        <td>1991-10-17</td>
    </tr>
    <tr>
        <th>party</th>
        <td>후보자의 정당</td>
        <td>무소속</td>
    </tr>
    <tr>
        <th>district</th>
        <td>지역구 데이터. 각 지역을 쉼표로 구분</td>
        <td>제주시, 갑</td>
    </tr>
    <tr>
        <th>candidacy_name</th>
        <td>후보자의 이름</td>
        <td>강딴딴</td>
    </tr>
    <tr>
        <th>img_url</th>
        <td>등록된 프로필 URL</td>
        <td>http://www.assembly.go.kr/photo/xxx.jpg</td>
    </tr>
    <tr>
        <th>person_id</th>
        <td>팀포퐁의 인물 정보 ID TB_POPONG_19.person_id</td>
        <td>19521138</td>
    </tr>
</tbody>

</table>

-------------


### TB_POPONG_19

member_name 필드 값을 이용해서 TB_member_report 테이블을 참조한다.
이름은 유일이 아니기 때문에 위험하지만, 동명이인은 4명밖에 없는 특수한 상황이므로 수동으로 확인한다.
<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>person_id</th>
        <td>팀포퐁의 인물 정보 ID</td>
        <td>19521138</td>
    </tr>
    <tr>
        <th>party</th>
        <td>19대 국회에서 정당</td>
        <td>무소속</td>
    </tr>
    <tr>
        <th>when_elected</th>
        <td>역대 국회의원 선거 당선 대수.</td>
        <td>18대,19대</td>
    </tr>
    <tr>
        <th>commitee</th>
        <td>소속 위원회명</td>
        <td>정무위원회</td>
    </tr>
    <tr>
        <th>experience</th>
        <td>경력. '||'로 구분</td>
        <td>한국고등학교 졸업(1회)|| 한국대 컴퓨터공학 졸업 ||</td>
    </tr>
    <tr>
        <th>bill_keywords</th>
        <td>후보자의 의안 키워드. 많이 언급한 키워드 순이며 '||' 로 구분</td>
        <td>공무원||부장||정보||농립||지방자치단체||특례||시장||해양||사람||지역</td>
    </tr>
    <tr>
        <th>member_name</th>
        <td>19대 국회의원 이름. 동명이인 4명 TB_MEMBER_REPORT.memeber_name</td>
        <td>강관우</td>
    </tr>
    <tr>
        <th>member_birthday</th>
        <td>후보자의 생일</td>
        <td>1991-10-17</td>
    </tr>
</tbody>

</table>

-----------------

### TB_MEMBER_REPORT

TB_POPONG_19의 memeber_name과 참조관계를 맺을 예정임. 동명이인은 4명. 수동으로 마이그레이션

<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>member_id</th>
        <td>열려라 국회의 국회의원 ID</td>
        <td>343</td>
    </tr>
    <tr>
        <th>member_name</th>
        <td>열려라 국회의 국회의원 이름</td>
        <td>강관우</td>
    </tr>
    <tr>
        <th>member_birthday</th>
        <td>후보자의 생일</td>
        <td>1991-10-17</td>
    </tr>
    <tr>
        <th>attendance_rate</th>
        <td>19대 국회 본회의참석률</td>
        <td>91.00%</td>
    </tr>
    <tr>
        <th>proposal</th>
        <td>법안 대표발의 건수</td>
        <td>125건</td>
    </tr>
</tbody>

</table>

----------

### TB_CANDIDACY_KEYWORDS

<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>keyword_id</th>
        <td>후보자와 키워드를 결정하는 기본키</td>
        <td>111</td>
    </tr>
    <tr>
        <th>candidacy_id</th>
        <td>후보 등록 번호. TB_CANDIDACIES.candidacy_id</td>
        <td>191919</td>
    </tr>
    <tr>
        <th>keyword_name</th>
        <td>키워드 명</td>
        <td>군납비리</td>
    </tr>
</tbody>
</table>

-------------------

### TB_KEYWORD_NEWS

키워드 별로 news_status 값이 'S'인 뉴스만 10개까지 배치 

기본은 최신순으로 10개 선별 후 'S'값으로 노출.

운영툴로 뉴스 선별 가능.

<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>keyword_id</th>
        <td>TB_CANDIDACY_KEYWORDS.keyword_id</td>
        <td>111</td>
    </tr>
    <tr>
        <th>news_id</th>
        <td>뉴스 아이디</td>
        <td>111112</td>
    </tr>
    <tr>
        <th>news_url</th>
        <td>뉴스 링크 URL</td>
        <td>http://www.jejusori.net/?mod=news&act=articleView&idxno=173370</td>
    </tr>
    <tr>
        <th>news_summary</th>
        <td>뉴스 요약</td>
        <td>제주시을, 현역 프리미엄 속 여야 후보들 설 민심잡기 총력전 </td>
    </tr>
        <tr>
        <th>news_status</th>
        <td>뉴스를 노출하는지 안하는지 상태값. S(service) B(blind)</td>
        <td>S</td>
    </tr>
</tbody>
</table>

--------------

### CODE_CITY

출처
> http://info.nec.go.kr/electioninfo/electionInfo_report.xhtml?electionId=0020120411&requestURI=%2Felectioninfo%2F0020120411%2Fbi%2Fbigi05.jsp&topMenuId=BI&secondMenuId=BIGI&menuId=BIGI05&statementId=BIGI05&electionCode=2


<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>city_name</th>
        <td>시/도 이름</td>
        <td>서울특별시</td>
    </tr>
    <tr>
        <th>city_code</th>
        <td>시/도 코드 : 1100~4900까지 코드 - 중앙선거관리위원회 cityCode</td>
        <td>1100</td>
    </tr>
</tbody>
</table>

-------------------

### CODE_COUNTY

<table>
	<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>city_code</th>
        <td>시/도 코드</td>
        <td>1100</td>
    </tr>
    <tr>
        <th>county_name</th>
        <td>구/시/군 이름</td>
        <td>중구</td>
    </tr>
    <tr>
        <th>county_code</th>
        <td>구/시/군 코드 :city_code + 0001~9999까지 숫자 </td>
        <td>11000001</td>
    </tr>
</tbody>
</table>

-------------------

### CODE_TOWNSHIP

<table>
<thead>
    <tr>
        <th>Column name</th>
        <th>Description</th>
        <th>ex</th>
    </tr>
</thead>
<tbody>
    <tr>
        <th>district_name</th>
        <td>선거구 명 콤마로 구분</td>
        <td>서울특별시, 중구</td>
    </tr>
    <tr>
        <th>county_code</th>
        <td>구/시/군 코드 :city_code + 100~999까지 조합 </td>
        <td>11000001</td>
    </tr>
    <tr>
        <th>township_name</th>
        <td>읍/면/동 이름</td>
        <td>소공동</td>
    </tr>
    <tr>
        <th>township_code</th>
        <td>읍/면/동 코드 : city_code + county_code + 0000~9999까지 숫자 </td>
        <td>110000010001</td>
    </tr>
</tbody>
</table>
-------------------
<a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.ko"><img alt="크리에이티브 커먼즈 라이선스" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a>
