package com.dthunn.security.repository;

import java.util.List;

import com.dthunn.security.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {
	
	@Query(value = "from Notice n where CURRENT_DATE BETWEEN n.noticBegDt AND n.noticEndDt")
	List<Notice> findAllActiveNotices();
}
