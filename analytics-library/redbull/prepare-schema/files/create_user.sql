create user f1 identified by Oracle_12345;
grant dwrole to f1;
alter user f1 quota unlimited on data;
grant create session to f1;
grant create table to f1;
begin
ords.enable_schema(p_enabled => true,
  p_schema => 'f1',
  p_url_mapping_type => 'BASE_PATH',
  p_url_mapping_pattern => 'f1',
  p_auto_rest_auth => true);
commit;
end;
/
CREATE TABLE F1.RACES
   (	"RACEID" NUMBER(38,0), 
	"YEAR" NUMBER(38,0), 
	"ROUND" NUMBER(38,0), 
	"NAME" VARCHAR2(255), 
	"F1DATE" DATE, 
	"TIME" VARCHAR2(255), 
	"URL" VARCHAR2(500), 
	"SCORE" NUMBER, 
	"DNF_COUNT" NUMBER, 
	"DNF_DUE_TO_ACCIDENT_COUNT" NUMBER, 
	"WEATHER" VARCHAR2(500), 
	"WEATHER_WET" VARCHAR2(1), 
	"CIRCUITREF" VARCHAR2(100), 
	"YEAR_C" VARCHAR2(4), 
	"RACE_COUNT" NUMBER, 
	"NAME_YEAR" VARCHAR2(100), 
	"OVERTAKEN_POSITIONS_TOTAL" NUMBER
   );
CREATE TABLE F1.LAP_TIMES
   (	"RACEID" NUMBER(38,0), 
	"DRIVERID" NUMBER(38,0), 
	"LAP" NUMBER(38,0), 
	"POSITION" NUMBER(38,0), 
	"MILLISECONDS" NUMBER(38,0), 
	"DRIVERREF" VARCHAR2(100), 
	"RACE_NAME" VARCHAR2(100), 
	"PIT_STOP" VARCHAR2(1), 
	"MILLISECONDS_CUMULATIVE" NUMBER, 
	"MEDIAN_MILLISECONDS_CUMULATIVE" NUMBER
   );
CREATE TABLE F1.SAFETY_CAR
   (	"YEAR" NUMBER(38,0), 
	"RACE" VARCHAR2(128), 
	"COUNT" NUMBER(38,0), 
	"LAPS" NUMBER(38,0)
   );
