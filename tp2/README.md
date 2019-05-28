Créer 1 réseau, 2 sous-réseau :
* 1er sous réseau : 1 machine admin dont le port 22 est ouvert
* 2e sous-réseau, avec 2 plages d'adresses secondaires : 1 pour les clsuters , 1 pour les pods.
Déployer un cluster Kubernetes dont les noeuds seront dans ce sous-réseau, en adresse IP privée.
Le master est accessible par l'administration sur lequel il faudra installer kubectl. Il porte une adresse externe aux sous-réseaux.

On déploie ensuite un ingress controler via la machine d'administration

On déploie un service example (cf create_service_for_dns_test.sh) puis on ajoute une rêgle de zone DNS dans les jeux d'enregistrements du GCP hello-world.info -> accès à l'application 