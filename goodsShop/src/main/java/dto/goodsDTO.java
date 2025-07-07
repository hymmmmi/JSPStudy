package dto;

public class goodsDTO {
	
	private String i_id;
	private String i_name;
	private int i_unitPrice;
	private String i_description;
	private String i_size;
	private String i_category;
	private long i_unitInStock;
	private String i_fileName;
	
	
	public goodsDTO() {
		super();
	}


	public goodsDTO(String i_id, String i_name, int i_unitPrice) {
		// TODO Auto-generated constructor stub
	}


	public String getI_id() {
		return i_id;
	}


	public String getI_name() {
		return i_name;
	}


	public int getI_unitPrice() {
		return i_unitPrice;
	}


	public String getI_description() {
		return i_description;
	}


	public String getI_size() {
		return i_size;
	}


	public String getI_category() {
		return i_category;
	}


	public long getI_unitInStock() {
		return i_unitInStock;
	}


	public String getI_filename() {
		return i_fileName;
	}


	public void setI_id(String i_id) {
		this.i_id = i_id;
	}


	public void setI_name(String i_name) {
		this.i_name = i_name;
	}


	public void setI_unitPrice(int i_unitPrice) {
		this.i_unitPrice = i_unitPrice;
	}


	public void setI_description(String i_description) {
		this.i_description = i_description;
	}


	public void setI_size(String i_size) {
		this.i_size = i_size;
	}


	public void setI_category(String i_category) {
		this.i_category = i_category;
	}


	public void setI_unitInStock(long i_unitInStock) {
		this.i_unitInStock = i_unitInStock;
	}


	public void setI_filename(String i_filename) {
		this.i_fileName = i_filename;
	}


	@Override
	public String toString() {
		return "goodsDTO [i_id=" + i_id + ", i_name=" + i_name + ", i_unitPrice=" + i_unitPrice + ", i_description="
				+ i_description + ", i_size=" + i_size + ", i_category=" + i_category + ", i_unitInStock="
				+ i_unitInStock + ", i_filename=" + i_fileName + "]";
	}
	
	
	
}
