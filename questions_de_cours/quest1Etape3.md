# Quest 1 - Étape 3: Réponses aux Questions

## 1. Qu'est-ce qu'une clé SSH et pourquoi est-elle utilisée ?

Une **clé SSH** (Secure Shell) est une paire de clés cryptographiques utilisée pour authentifier et sécuriser une connexion à distance entre deux systèmes. La clé publique est distribuée et placée sur les serveurs, tandis que la clé privée est conservée secrète sur l'ordinateur de l'utilisateur. Elle est utilisée pour sécuriser les communications et éviter les connexions non autorisées lors de la gestion des serveurs distants, par exemple pour se connecter à une instance AWS.

## 2. A quoi sert le `aws_security_group` ?

Un **`aws_security_group`** agit comme un pare-feu virtuel pour vos instances EC2 dans AWS. Il permet de définir des règles pour le trafic entrant et sortant, spécifiant quels types de trafic (protocole, port, adresse IP source) sont autorisés ou refusés. Il aide à protéger les ressources AWS contre des accès non désirés en appliquant des règles de sécurité granulaires.

## 3. Qu'est-ce qu'un `root_block_device` ?

Un **`root_block_device`** est le volume de stockage principal attaché à une instance EC2. Il contient le système d'exploitation et d'autres données nécessaires pour démarrer et faire fonctionner l'instance. Les caractéristiques de ce volume, telles que sa taille, son type (SSD ou HDD), et s'il est supprimé ou non lors de l'arrêt de l'instance, peuvent être configurées lors de la création de l'instance.

## 4. A quoi servent les blocks de type `output` ?

Les **blocks de type `output`** dans Terraform permettent d'afficher des informations après l'exécution d'un plan Terraform ou d'une commande `terraform apply`. Par exemple, ils peuvent être utilisés pour afficher l'adresse IP publique d'une instance, un ID de ressource, ou d'autres détails importants sur les ressources créées, facilitant ainsi la consultation de ces informations sans avoir à parcourir les logs ou fichiers d'état.
