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
