# Introduction

Pi-hot est un petit script qui vous permet d'être avertis en cas de surchauffe de votre Raspberry Pi.
Il fonctionne sur le principe du relevé de température de la sonde du CPU qu'il va comparer avec des valeurs préalablement définies.
En cas de chauffe, un webhooks discord vous en avertira et cas de surchauffe un wekhooks vous en avertira également en plus de couper le Raspberry.

# Installation

Pour installer pi-hot, il vous suffit de télécharger le repo et de le mettre dans l'emplacement que vous le voulez.
Ensuite, vous pouvez ouvrir crontab avec la commande suivante : 

```
sudo crontab -e
```

Et y inserrer la ligne suivante 

```
*/5 * * * * sudo bash /EMPLACEMENT/pi-hot.sh >> /dev/null
```
En oublient pas de remplacer "EMPLACEMENT" par le chemin d'accès du script
Ce qui va permettre une exécution du script toutes les 5 minutes (vous pouvez définir l'intervalle de temps qui vous convient).

# Configuration

Une fois l'installation effectuer, vous devez passer à la configuration des variables suivantes :

```
max_temp="100"
warn_temp="60"
webhooks_url=""
shutdowncmd="poweroff"
```

max_temp="100" :
Température à la quelle le Raspberry devra être arrêté.

warn_temp="60" :
Température à la quelle vous recevrez un avertissement.

webhooks_url="" : 
Lien de votre webhooks discord

shutdowncmd="poweroff" :
Commande d'arrêt du système, à adapter selon votre utilisation.

# Autre
Il est possible d'obtenir la température du Raspberry Pi en ajoutant l'argument ```--manual```
Cela va vous permettre d'obtenir la température de votre Raspberry Pi directement sans que les conditions de surchauffe ne sois remplie.
Je recommande d'effectuer cette action de manière manuelle pour vérifier le bon fonctionnement du système.

## Remaque
Cette option ne déclenche en aucun cas les procédures définit en cas de surchauffe !

## Ligne de démarrage
```
sudo bash /EMPLACEMENT/pi-hot.sh --manual
```
