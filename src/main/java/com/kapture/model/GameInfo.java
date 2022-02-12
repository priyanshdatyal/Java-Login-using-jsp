package com.kapture.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class GameInfo {

	 	String name;
	 	String desc;
	 	String link;
	 	
	 	public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}

		public String getLink() {
			return link;
		}

		public void setLink(String link) {
			this.link = link;
		}

		public List<GameInfo> getGames(ResultSet rs) 
		{
	 	     List<GameInfo> list=new ArrayList<GameInfo>();
	 	      try {
					while (rs.next()) {
						 GameInfo game=new GameInfo();
						game.setName(rs.getString("GameName"));
						game.setDesc(rs.getString("GameDesc"));
						game.setLink(rs.getString("GameIcon"));
					     list.add(game);
					  }
			 	      rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	 	      return list;
 	  }
		
		public void printList(List<GameInfo> list) {
			for (GameInfo model : list) {
	            System.out.println(model.getName());
	            System.out.println(model.getDesc());
	            System.out.println(model.getLink());
	            System.out.println("--------------------------");
	        }
		}
	 	
}
