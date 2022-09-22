# Configuration des outils de déploiement

Pour G'Impacte, le compte à utiliser est __nom@entreprisecom__.
Il faut ensuite créer 3 authetification, une pour chaque environnement :

`pac auth create --name nomprojet-dev --url https://org00000001.crmXX.dynamics.com/`  
`pac auth create --name nomprojet-preprod --url https://org00000002.crmXX.dynamics.com/`  
`pac auth create --name nomprojet-prod --url https://org00000003.crmXX.dynamics.com/`  

Vous aurez besoin des identifiants pour configurer l'authentification google, microsoft ou autres sur le portail.  
Télecharger le fichier attaché "env_variables.txt" et placez le dans le même dossier que le README.
Il faut remplir les différentes informatioins du fichier.

# Export du portail
## Pour le premier export
Il faut modifier le fichier export_portal.ps1

1) Remplir $portalId = ""
Pour retrouver l'id, il faut tout d'abord s'authentier :
`pac auth select -n nomprojet-$environment`
Puis cherche l'id dans la liste des portails : 
`pac paportal list`

2) Remplacer nomprojet par le nom souhaité

## A chaque export, lancer la commande suivante : 
`.\alm\export_portail.ps1 -environment dev`

# Import du portail
**latest est un raccourci qui prend la dernière version exportée par le script d'export**  
Le fichier deployment profile correspondant à l'environnement doit être mis à jour avant de lancer l'import.
`.\alm\import_portal.ps1 -environment preprod -Version latest`
`.\alm\import_portal.ps1 -environment preprod`
