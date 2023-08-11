package SourcePackages;

import java.sql.SQLException;
import java.util.*;


public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
      //  Conexion.getConexion();
       // System.out.println("Conectado con la base de datos");
        // EstructuraDeDatosMySQL msm = new EstructuraDeDatosMySQL("Hola desde Main", "Main",);
        Dao dao = new Dao();
    //    int registro = dao.insertar(msm);
      //  System.out.println(registro);

      //  EstructuraDeDatosMySQL msm = new EstructuraDeDatosMySQL(7,"Hola desde MainWEB", "WEB");
      //  int registro = dao.editar(msm);
     //   System.out.println(registro);

        EstructuraDeDatosMySQL msm = new EstructuraDeDatosMySQL(7);
           int registro = dao.eliminar(msm);
           System.out.println("Se elimino " + registro);

        List<EstructuraDeDatosMySQL> mensajes = dao.seleccionar();

        for (EstructuraDeDatosMySQL mensaje : mensajes) {
            System.out.println(mensaje);
        }
    }
}
