# Questions sur Terraform

## Qu'est-ce que l'Infrastructure as code ?

L'Infrastructure as Code (IaC) est une pratique qui consiste à gérer et provisionner des ressources informatiques à travers des fichiers de configuration lisibles et modifiables. Ces fichiers décrivent l'infrastructure de manière déclarative ou impérative, permettant aux équipes de déployer, gérer et versionner l'infrastructure de manière similaire au code applicatif. Cela permet une plus grande automatisation, une gestion plus efficace des versions et une meilleure collaboration.

## À quoi sert Terraform ?

Terraform est un outil open source développé par HashiCorp qui permet de décrire et de gérer une infrastructure à l'aide de code, via le concept d'Infrastructure as Code (IaC). Il est utilisé pour provisionner, configurer et gérer des infrastructures sur une large gamme de plateformes, notamment les services cloud publics (comme AWS, Azure, GCP), les clouds privés et les environnements sur site. Terraform simplifie le déploiement d'environnements complexes en rendant les infrastructures reproductibles, traçables et cohérentes.

## Qu'est-ce qu'un provider Terraform ?

Un provider dans Terraform est un plugin qui permet à Terraform d'interagir avec des API spécifiques pour gérer des ressources. Chaque provider est associé à une ou plusieurs plateformes, comme un service cloud (AWS, Azure, GCP), des services SaaS, ou encore des systèmes locaux comme des bases de données. Les providers fournissent des ressources et des opérations spécifiques à la plateforme, permettant à Terraform de gérer l'infrastructure de manière unifiée.