package egovframework.ex.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.ex.service.exService;

@Controller
public class exController {

	@Resource(name = "exService")
	private exService exService;
	
	@RequestMapping(value = "/oneGrid.do")
	public String oneGrid(Model model) throws Exception {
		return "main/oneGrid";
	}
	@RequestMapping(value = "/twoGrid.do")
	public String twoGrid(Model model) throws Exception {
		return "main/twoGrid";
	}
	@RequestMapping(value = "/threeGrid.do")
	public String threeGrid(Model model) throws Exception {
		return "main/threeGrid";
	}
	@RequestMapping(value = "/exGrid.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exGrid(String type, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(type);
		JSONObject json = new JSONObject();
		List<Map> dataList = new ArrayList();
		for(int i=0;i<10;i++) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("name", "사람"+i);
			map.put("age", i+20);
			dataList.add(map);
		}
		json.put("rows",dataList);
		
		return json;
	}
}
