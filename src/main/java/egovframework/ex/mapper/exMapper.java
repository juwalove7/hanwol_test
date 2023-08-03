package egovframework.ex.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("exMapper")
public interface exMapper {
	List<?> selectTest() throws Exception;
}
