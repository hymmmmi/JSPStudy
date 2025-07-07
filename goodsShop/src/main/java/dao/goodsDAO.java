package dao;

import java.util.ArrayList;

import dto.goodsDTO;

public class goodsDAO {
	
	private static goodsDAO instance = new goodsDAO();
	
	public static goodsDAO getInstance() {
		return instance;
	}
	
	private ArrayList<goodsDTO> listofGoods = new ArrayList<goodsDTO>();
	
	public goodsDAO() {
		
		goodsDTO items1 = new goodsDTO("25HOME","25홈유니폼",109000);
		items1.setI_description("2025년 홈그라운드 유니폼입니다");
		items1.setI_category("Home");
		items1.setI_unitInStock(10);
		items1.setI_filename("25HOME.jpg");
		
		goodsDTO items2 = new goodsDTO("25AWAYS","25원정유니폼",109000);
		items2.setI_description("2025년 원정 유니폼입니다");
		items2.setI_category("Aways");
		items2.setI_unitInStock(10);
		items2.setI_filename("25AWAYS.jpg");
		
		goodsDTO items3 = new goodsDTO("25Ball","25싸인볼",20000);
		items3.setI_description("2025년 수원블루윙즈 싸인볼입니다");
		items3.setI_category("Acc");
		items3.setI_unitInStock(10);
		items3.setI_filename("25Ball.jpg");
		
		goodsDTO items4 = new goodsDTO("25Keyring","25마스코트키링",15000);
		items4.setI_description("2025년 수원블루윙즈 마스코트 키링입니다");
		items4.setI_category("Acc");
		items4.setI_unitInStock(10);
		items4.setI_filename("25Keyring.jpg");
		
		goodsDTO items5 = new goodsDTO("25Muffler","25머플러",20000);
		items5.setI_description("2025년 수원블루윙크 니트머플러입니다");
		items5.setI_category("Acc");
		items5.setI_unitInStock(10);
		items5.setI_filename("25Muffler.jpg");
		
		listofGoods.add(items1);
		listofGoods.add(items2);
		listofGoods.add(items3);
		listofGoods.add(items4);
		listofGoods.add(items5);
	}
	
	public void addGoods(goodsDTO goods) {
		listofGoods.add(goods);
	}
	
	public goodsDTO getGoodsById(String goodsId) {
		
		goodsDTO goodsById = null;
		
		for(int i =0; i<listofGoods.size(); i++) {
			
			goodsDTO goods = listofGoods.get(i);
			
			if(goods != null && goods.getI_id() !=null && goods.getI_id().equals(goodsId)) {
				goodsById = goods;
				break;
			}
		}		
		return goodsById;
	}
}
