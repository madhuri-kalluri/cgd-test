select cdm_version, vocabulary_version from dbo.cdm_source;

select R.relationship_name 
from concept_relationship CR join relationship R on CR.relationship_id = R.relationship_id 
where CR.concept_id_1 = 105694 or CR.concept_id_2 = 105694;

select count(gender_concept_id), gender_concept_id from Person 
where gender_concept_id in (select concept_id from concept where concept_name in ('MALE', 'FEMALE')) 
group by gender_concept_id;

select person_id, observation_period_start_date, observation_period_end_date 
from observation_period 
where (observation_period_start_date between '2009-01-01' and '2010-12-31') and (observation_period_end_date between '2009-01-01' and '2010-12-31');

select distinct person_id, procedure_concept_id 
from procedure_occurrence 
where procedure_concept_id in (select concept_id from concept where concept_name like '%Dialysis%');

select distinct PO.person_id, PO.procedure_concept_id, PO.provider_id, P.provider_name
from procedure_occurrence PO join provider P on PO.provider_id = P.provider_id
where PO.procedure_concept_id in (select concept_id from concept where concept_name like '%Dialysis%')
order by P.provider_name;

