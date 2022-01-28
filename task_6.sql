--Соискатели ищут работу по графику работы и опыту работы
CREATE INDEX experience_schedule_index on vacancy(experience_id,schedule_id);

--Соискатели ищут работу по локации и зарплате
CREATE INDEX comp_from_to_area_index on vacancy(compensation_from,compensation_to,area_id);