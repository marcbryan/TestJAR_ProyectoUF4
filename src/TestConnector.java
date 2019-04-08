import java.sql.ResultSet;
import java.sql.SQLException;

public class TestConnector {
	public static void main(String[] args) {
		MySQLConnector con = new MySQLConnector();
		con.createConnection("localhost/forhonor", "marc", "1234");
		ResultSet rs = con.executeQuery("SELECT * FROM faccion");
		/*
		// Mostrar datos
		try {
			while (rs.next()) {
				int id = rs.getInt(1);
				String nombre = rs.getString(2);
				String lore = rs.getString(3);
				System.out.println("faccion_id: "+id+", nombre_faccion: "+nombre+", lore: "+lore);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		ResultSet rs2 = con.executeQuery("SELECT * FROM personaje");
		
		// Llama al Stored Procedure
		con.callProcedure("{CALL insertar_personaje('pers_procedure', 40, 25, 1)}");
		
		
		// INSERT
		con.executeUpdate("INSERT INTO personaje (`nombre_personaje`, `ataque`, `defensa`, `faccion_id`) VALUES ('test', 25, 20, 1)");
		con.executeUpdate("INSERT INTO personaje (`nombre_personaje`, `ataque`, `defensa`, `faccion_id`) VALUES ('player21', 45, 35, 2)");
		
		// UPDATE
		con.executeUpdate("UPDATE personaje SET ataque = 50 WHERE nombre_personaje = 'test'");
		con.executeUpdate("UPDATE personaje SET defensa = 60 WHERE nombre_personaje = 'player21'");
		
		// DELETE
		con.executeUpdate("DELETE FROM personaje WHERE nombre_personaje = 'test'");
		con.executeUpdate("DELETE FROM personaje WHERE nombre_personaje = 'player21'");
		
		
		// Cambiar de usuario 
		con.createConnection("localhost/forhonor", "admin", "admin");
		ResultSet rs3 = con.executeProcedure("{CALL seleccionar_faccion('Caballeros')}");
		/*
		// Mostrar datos
		try {
			while (rs3.next()) {
				int id = rs3.getInt(1);
				String nombre = rs3.getString(2);
				int atk = rs3.getInt(3);
				int def = rs3.getInt(4);
				String nombre_faccion = rs3.getString(5);
				System.out.println("id: "+id+", nombre: "+nombre+", ataque: "+atk+", defensa: "+def+", nombre_faccion: "+nombre_faccion);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		// Consultar datos de las consultas
		System.out.println("\nConsultas realizadas en la base de datos 'forhonor' por el usuario 'marc'");
		con.query1("forhonor", "marc");
		System.out.println("\nConsultas realizadas en la base de datos 'dbprueba' por el usuario 'fail'");
		con.query1("dbprueba", "fail");
		System.out.println("\nConsultas del tipo 'UPDATE' realizadas en la base de datos 'forhonor' por el usuario 'marc'");
		con.query2("forhonor", "marc", "UPDATE");
		System.out.println("\nConsultas del tipo 'STORED PROCEDURE' realizadas en la base de datos 'forhonor'");
		con.query3("forhonor", "STORED PROCEDURE");
		System.out.println("");
		
		// Cambiar de base de datos
		con.createConnection("localhost/battlefieldv", "admin", "admin");
		// SELECT
		ResultSet rs4 = con.executeQuery("SELECT * FROM weapon");
		ResultSet rs5 = con.executeQuery("SELECT * FROM bfplayer");
		
		// INSERT
		con.executeUpdate("INSERT INTO device VALUES (8, 'Linterna')");
		con.executeUpdate("INSERT INTO bfplayer VALUES ('player1', 3, 1, 8, 40, 25)");
		
		// UPDATE
		con.executeUpdate("UPDATE device SET name = 'Linterna mejorada' WHERE name = 'Linterna' ");
		con.executeUpdate("UPDATE bfplayer SET kills = 100, deads = 40 WHERE user_id = 'player1'");
		
		// DELETE
		con.executeUpdate("DELETE FROM device WHERE device_id = 8");
		con.executeUpdate("DELETE FROM bfplayer WHERE user_id = 'player1'");
		
		// Llamar al Stored Procedure
		ResultSet rs6 = con.executeProcedure("{CALL seleccionar_clase('Assault')}");
		/*
		// Mostrar datos
		try {
			while (rs6.next()) {
				String id = rs6.getString(1);
				String clase = rs6.getString(2);
				String device = rs6.getString(3);
				String weapon = rs6.getString(4);
				int kills = rs6.getInt(5);
				int deads = rs6.getInt(6);
				System.out.println("class_id: "+id+", class: "+clase+", device_name: "+device+", weapon_name: "+weapon+", kills: "+kills+", deads: "+deads);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		// Consultar datos de las consultas
		System.out.println("\nConsultas realizadas en la base de datos 'battlefieldv' por el usuario 'admin'");
		con.query1("battlefieldv", "admin");
		System.out.println("\nConsultas del tipo 'STORED PROCEDURE' realizadas en la base de datos 'battlefieldv' por el usuario 'admin'");
		con.query2("battlefieldv", "admin", "STORED PROCEDURE");
		System.out.println("\nConsultas del tipo 'INSERT' realizadas en la base de datos 'battlefieldv'");
		con.query3("battlefieldv", "INSERT");
		
	}
}
