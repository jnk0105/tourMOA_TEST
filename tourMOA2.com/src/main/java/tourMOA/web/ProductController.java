package tourMOA.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("product/main.do")
	public String main() throws Exception{		
		return "product/main";		
	}
}
