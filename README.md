Projet Symfony - Guillaume HANOTEL

INSTALLATION

Clone du projet :

git clone https://github.com/guillaumehanotel/Personal-Website-V2
Soyez sûr que le propriétaire/groupe du projet soient bien celui de votre utilisateur courant, si ce n'est pas le cas :

sudo chown -R $USER:$USER Personal-Website-V2
Rendez vous maintenant dans le dossier du projet :

L'installation se fait grâce à l'utilitaire make, plus particulièrement grâce à la commande :

make install
Si l'utilisateur Apache de votre système n'est pas 'www-data' par défaut, vous pouvez passer en paramètre le bon :

make install APACHE_USER=http
Enfin pour lancer le serveur :

make server
Vous pouvez inspecter le fichier Makefile pour plus d'informations, mais voici les opérations effectués :

Install Vendor
Cache Clear
Création BDD/Tables/Garnissage des tables
Changement des permissions
Si à un moment, un problème de cache apparait, vous pouvez utiliser la commande

make cache-clear
USAGE

Accès Espace Admin

L'accès à l'espace admin est accessible lorsque que vous passez votre souris en bas à droite de votre navigateur, une petite icone cliquable apparaitra.

Par défaut, j'ai conçu ce site web pour qu'il n'y est qu'un seul utilisateur, il n'y a donc pas de page Inscription.

Les identifiants de connexion pour l'unique utilisateur/administrateur sont :

Identifiant : guillaumeh
Mot de Passe : erty
Une fois sur l'espace d'administration, vous pouvez vous déconnecter grâce au menu en haut à droite.

Envoi Mail

Pour des raisons évidentes, je n'ai pas transmis mon mot de passe gmail dans les paramètres par défaut, mais les autres paramètres de messagerie sont corrects et sachez qu'avec mon mdp gmail, l'envoi de mail fonctionne avec le formulaire de contact.

Commentaires

Pour l'exercice, j'ai géré la gestion des images (avatar) pour les utilisateurs, qui sont notamment affiché à côté des commentaires postés. Lorsque l'utilisateur/l'administrateur n'est pas connecté, le formulaire de commentaires contient les champs Nom et Commentaire. Lorsque qu'un utilisateur est connecté, le champ Nom n'est pas demandé et est automatiquement rempli avec les infos de l'utilisateur connecté.

En somme, les commentaires postés par des visiteurs auront tous un avatar par défaut, tandis que si c'est moi (connecté) qui poste un commentaire, mon avatar sera affiché.

PS :

N'hésitez pas à me faire un retour sur les erreurs que j'aurais commises ou les points à améliorer.
