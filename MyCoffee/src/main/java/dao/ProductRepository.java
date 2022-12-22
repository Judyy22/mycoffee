package dao;

import java.util.ArrayList;
import java.sql.*;
import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String userid = "cafe";
	private static String pwd = "cafe";

	public static ProductRepository getInstance() {
		return instance;
	}

	public ProductRepository() {
		/*
		 * Product espresso = new Product("E0001", "Cafe Americano", 4500); espresso.
		 * setDescription("진한 에스프레소와 뜨거운 물을 섞어 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피");
		 * espresso.setCategory("Espresso"); espresso.setFilename("E0001.png");
		 * 
		 * Product cake = new Product("C0001", "Tiramisu Cake", 6900);
		 * cake.setDescription("고소한 마스카포네 치즈 크림에 촉촉한 커피 시트가 입안을 감싸는 기분 좋은 느낌의 떠먹는 티라미수"
		 * ); cake.setCategory("Cake"); cake.setFilename("C0001.png");
		 * 
		 * Product tea = new Product("T0001", "Grapefruit Honey Black Tea", 5500);
		 * tea.setDescription("새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 블랙 티의 조화");
		 * tea.setCategory("Tea"); tea.setFilename("T0001.png");
		 * 
		 * Product frappuccino = new Product("F0001", "Vanilla Frappuccino", 6500);
		 * frappuccino.setDescription("신선한 우유와 바닐라 시럽이 어우러진 크림 프라푸치노");
		 * frappuccino.setCategory("Frappuccino"); frappuccino.setFilename("F0001.png");
		 * 
		 * Product blended = new Product("B0001", "Red Power Smash Blended", 5000);
		 * blended.setDescription("붉은 색의 에너지로 가득 채워진 시원하고 상큼하게 즐기는 타트 체리 블렌디드 음료");
		 * blended.setCategory("Blended"); blended.setFilename("B0001.png");
		 * 
		 * listOfProducts.add(espresso); listOfProducts.add(cake);
		 * listOfProducts.add(tea); listOfProducts.add(frappuccino);
		 * listOfProducts.add(blended);
		 */
	}

	public ArrayList<Product> getAllProducts() {
		String sql = "select * from product";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitprice"));

				listOfProducts.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOfProducts;
	}

	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, userid, pwd);
			System.out.println("DB 연동 완료");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return conn;
	}

	public Product getProductById(String productId) {
		Product productById = new Product();
		String sql = "select * from product where p_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);

			rs = pstmt.executeQuery();
			if (!rs.next())
				return null;
			if (rs.next()) {
				productById.setProductId(rs.getString("p_id"));
				productById.setPname(rs.getString("p_name"));
				productById.setUnitPrice(rs.getInt("p_unitprice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * for (int i = 0; i < listOfProducts.size(); i++) { Product product =
		 * listOfProducts.get(i); if (product != null && product.getProductId() != null
		 * && product.getProductId().equals(productId)) { productById = product; break;
		 * } }
		 */
		return productById;
	}

	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
