package com.shizhichao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shizhichao.entity.Spec;
import com.shizhichao.entity.SpecOption;

public interface SpecDao {

	List<Spec> list(@Param("name")String name);

	int addSpec(Spec spec);

	int addOption(SpecOption specOption);

	int updateSpec(Spec spec);

	int deleteSpecOtions(int id);

	int deleteSpec(int id);

	Spec get(int id);

	int deleteSpecOtionsBatch(int[] ids);

	int deleteSpecBatch(int[] ids);

	List<Spec> listAll();

}
