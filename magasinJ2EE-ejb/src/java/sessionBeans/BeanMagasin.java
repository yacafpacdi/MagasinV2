package sessionBeans;

import Outils.CustomException;
import entites.Produit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class BeanMagasin implements BeanMagasinLocal {
    private static final String REF_PATTERN = "ARV-REF-";

    @PersistenceContext(unitName = "magasinJ2EE-ejbPU")
    private EntityManager em;
    
    
    @Override
    public Produit creerProduit(String ref, String label, 
            String sprix, String sqte) throws CustomException{
        Double prix = -1.0;
        Integer qte = -1;
        try{
            prix = Double.valueOf(sprix);
        }catch(NumberFormatException ex){
            //
        }
        
        try {
            
            qte = Integer.valueOf(sqte);
        }catch(NumberFormatException ex){
            //
        }
        return creerProduit(ref, label, prix, qte);
    }
    
    @Override
    public Produit creerProduit(String ref, String label, 
            Double prix, Integer qte) throws CustomException{
        HashMap<String, String> mp = new HashMap();
        if (ref != null) {
            ref = ref.trim();
        }
        
        if (!ref.matches(REF_PATTERN + "[0-9]{5}")) {
            mp.put("errReference", "la reference commence par " + REF_PATTERN + " suivi de 5 chiffres");
        }

        if (prix <= 0) {
            mp.put("errPrix", "un prix valide est obligatoire");
        }
        
        if(qte < 0){
            mp.put("errQte", "Quantité invalide");
        }
        
        if (!mp.isEmpty()) {
            throw new CustomException(mp, CustomException.ERR_PRODUIT);
        }

        Produit p = new Produit(ref, label, prix, qte);
        em.persist(p);
        return p;
    }
    
    @Override
    public void creerJeuxDonnees(){
        List<Produit> lp = new ArrayList();
        lp.add(new Produit(REF_PATTERN+"00001", "pomme", 0.5, 5));
        lp.add(new Produit(REF_PATTERN+"00002", "poire", 0.4, 6));
        lp.add(new Produit(REF_PATTERN+"00003", "cerise", 0.3, 8));
        lp.add(new Produit(REF_PATTERN+"00004", "banane", 0.1, 10));
        lp.add(new Produit(REF_PATTERN+"00005", "clementine", 0.2, 9));
        
        for(Produit p:lp){
            em.persist(p);
        }
    }
    
    @Override
    public List<Produit> selectAllproduit(){
        String req = "select p from Produit p";
        Query qr = em.createQuery(req);
        return qr.getResultList();
    }

}
