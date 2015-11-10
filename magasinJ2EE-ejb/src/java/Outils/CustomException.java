package Outils;

import java.util.HashMap;

public class CustomException extends Exception {
    public static final String ERR_PRODUIT;
    public static final String ERR_INSCRIPTION;
    static {
        ERR_INSCRIPTION= "erreur d'inscription";
        ERR_PRODUIT = "erreur sur le produit";
    }
    
    private HashMap<String, String> erreurs;

    public CustomException() {
        erreurs = new HashMap();
    }

    public CustomException(HashMap<String, String> erreurs, String message) {
        super(message);
        this.erreurs = erreurs;
    }

    public HashMap<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(HashMap<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
}
