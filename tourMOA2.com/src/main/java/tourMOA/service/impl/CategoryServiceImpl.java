package tourMOA.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import tourMOA.service.CategoryService;
import tourMOA.service.CategoryVO;
import tourMOA.service.DefaultListVO;

@Service("categoryService")
public class CategoryServiceImpl  extends EgovAbstractServiceImpl implements CategoryService {

	@Resource(name = "categoryDAO")
	private CategoryDAO categoryDAO;
	
	
	@Override
	public List<?> selectCategoryList(DefaultListVO vo) throws Exception {
		List<?> list = categoryDAO.selectCategoryList(vo);
		return list;
	}		
		
		
	@Override
	public String insertCategory(CategoryVO vo) throws Exception {
		return categoryDAO.insertCategory(vo);
	}	
}
