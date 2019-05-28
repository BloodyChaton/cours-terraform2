Créer 1 réseau, 2 sous-réseau :
* 1er sous réseau : 1 machine admin dont le port 22 est ouvert
* 2e sous-réseau, avec 2 plages d'adresses secondaires : 1 pour les clsuters , 1 pour les pods.
Déployer un cluster Kubernetes dont les noeuds seront dans ce sous-réseau, en adresse IP privée.
Le master est accessible par l'administration sur lequel il faudra installer kubectl. Il porte une adresse externe aux sous-réseaux.