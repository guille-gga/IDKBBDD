import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class CrearUsuario {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Usuario: ");
        String name = scanner.nextLine();

        System.out.print("Password: ");
        String password = scanner.nextLine();

        System.out.print("Email: ");
        String email = scanner.nextLine();

        System.out.print("Edad: ");
        int age = Integer.parseInt(scanner.nextLine());

        String url = "jdbc:sqlite:messageboard.db";

        String sql = "INSERT INTO users (name, password, email, age) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.setInt(4, age);

            pstmt.executeUpdate();

            System.out.println("Usuario creado exitosamente.");

        } catch (Exception e) {
            e.printStackTrace();
        }

        scanner.close();
    }
}
