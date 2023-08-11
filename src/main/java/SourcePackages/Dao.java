package SourcePackages;
import static SourcePackages.Conexion.*;
import java.sql.*;
import java.util.*;


public class Dao {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private EstructuraDeDatosMySQL mensaje;

    public List<EstructuraDeDatosMySQL> seleccionar() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM mensajes";
        List<EstructuraDeDatosMySQL> mensajes = new ArrayList<>();

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();

            while (this.rs.next()) {
                int id = this.rs.getInt("id_mensaje");
                String msm = this.rs.getString("mensaje");
                String autor = this.rs.getString("autor");
                String fecha = this.rs.getString("fecha");

                this.mensaje = new EstructuraDeDatosMySQL(id, msm, autor, fecha);
                mensajes.add(this.mensaje);
            }
        } catch(SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Cerrar recursos en el bloque finally para asegurar su liberación
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return mensajes;
    }

    public int insertar(EstructuraDeDatosMySQL mensaje) throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO mensajes(mensaje, autor, fecha) VALUES (?, ?, current_time())";
        int registros = 0;

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());

            registros = this.ps.executeUpdate();

        } catch(SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Cerrar recursos en el bloque finally para asegurar su liberación

            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return registros;
    }

    public int editar(EstructuraDeDatosMySQL mensaje) throws SQLException, ClassNotFoundException {

        String sql = "UPDATE mensajes SET mensaje=?, autor=? WHERE id_mensaje = ?";
        int registros = 0;

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());
            this.ps.setInt(3, mensaje.getId());

            registros = this.ps.executeUpdate();

        } catch(SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Cerrar recursos en el bloque finally para asegurar su liberación

            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return registros;
    }

    public int eliminar(EstructuraDeDatosMySQL mensaje) throws SQLException, ClassNotFoundException {

        String sql = "DELETE FROM mensajes WHERE id_mensaje =?";
        int registros = 0;

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setInt(1, mensaje.getId());

            registros = this.ps.executeUpdate();

        } catch(SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Cerrar recursos en el bloque finally para asegurar su liberación

            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return registros;
    }
}
