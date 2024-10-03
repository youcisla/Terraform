# Quest 1 - Étape 2: Réponses aux Questions

## 1. Qu'est-ce qu'un VPC ?

Un **VPC (Virtual Private Cloud)** est un réseau virtuel isolé dans AWS. Il permet de définir un espace réseau dans lequel vous pouvez déployer vos ressources AWS (comme des instances EC2, des bases de données, etc.) avec une grande flexibilité. Vous pouvez contrôler la plage d'adresses IP, configurer des sous-réseaux, des tables de routage, et des passerelles réseau pour gérer le trafic entrant et sortant de votre VPC.

## 2. Qu'est-ce qu'une ACL ?

Une **ACL (Access Control List)** est une liste de contrôle d'accès qui définit des règles permettant ou interdisant le trafic entrant et sortant à un ou plusieurs sous-réseaux dans un VPC. Les ACLs sont appliquées au niveau des sous-réseaux et agissent comme une couche de protection supplémentaire, permettant de filtrer le trafic par protocole, port, et adresse IP source/destination.

## 3. Qu'est-ce qu'un Subnet ?

Un **Subnet (Sous-réseau)** est une subdivision logique d'un VPC. Chaque sous-réseau contient une partie de la plage d'adresses IP du VPC et se situe dans une zone de disponibilité spécifique. Les sous-réseaux permettent d'isoler différentes parties de votre infrastructure (par exemple, front-end, back-end, bases de données) et de mieux contrôler la sécurité et la gestion du réseau.

## 4. À quoi sert la `aws_route_table` ?

La **`aws_route_table`** définit les routes qu'un sous-réseau dans un VPC doit suivre pour envoyer et recevoir du trafic. Par exemple, une route peut spécifier que tout le trafic sortant vers l'Internet (0.0.0.0/0) doit passer par une Internet Gateway. Elle sert à diriger le trafic entre les sous-réseaux d'un VPC et vers/depuis Internet ou d'autres VPCs.

## 5. À quoi sert la `aws_route_table_association` ?

La **`aws_route_table_association`** associe une table de routage (`aws_route_table`) à un sous-réseau spécifique. Cette association indique que le sous-réseau doit utiliser la table de routage spécifiée pour gérer son trafic réseau. C'est ainsi que Terraform lie un sous-réseau à une table de routage dans AWS.

---

## Schéma de l'infrastructure réseau

Vous devez inclure un schéma de votre infrastructure réseau. Voici ce que le schéma devrait inclure :
1. Un VPC avec la plage d'adresses `192.168.0.0/16`.
2. Un sous-réseau nommé `internal` avec la plage d'adresses `192.168.1.0/24`.
3. Une Internet Gateway reliée au VPC pour permettre l'accès à Internet.
4. Une table de routage avec une route vers l'Internet Gateway pour le sous-réseau.
5. Une instance EC2 pour chaque rôle :
   - Une instance nommée **reverse_proxy**.
   - Deux instances de type **backend**.
   - Une instance de type **base de données**.

N'oubliez pas de lier correctement les sous-réseaux à la table de routage et d'appliquer une ACL qui autorise uniquement le trafic SSH entrant sur le port 22 et tout le trafic sortant.

