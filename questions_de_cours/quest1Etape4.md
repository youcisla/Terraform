# Quest 1 - Étape 4: Réponses aux Questions

## 1. Qu'est-ce que fait la commande `terraform apply` ?

La commande `terraform apply` exécute les modifications décrites dans le plan Terraform (généré par `terraform plan`). Elle crée, met à jour ou supprime les ressources de l'infrastructure pour correspondre à l'état décrit dans les fichiers de configuration Terraform. Avant l'exécution des modifications, Terraform demande une confirmation, à moins que l'option `-auto-approve` ne soit utilisée pour automatiser le processus.

## 2. Qu'est-ce que fait la commande `terraform destroy` ?

La commande `terraform destroy` supprime toutes les ressources définies dans les fichiers de configuration Terraform. Elle est utilisée pour démanteler l'infrastructure une fois qu'elle n'est plus nécessaire, libérant ainsi des ressources et évitant les coûts inutiles. Avant de détruire les ressources, Terraform demande une confirmation de l'utilisateur.

## 3. Qu'est-ce que fait la commande `terraform plan` ?

La commande `terraform plan` génère un plan d'exécution, montrant les changements qui seront appliqués à l'infrastructure sans les exécuter. Elle permet à l'utilisateur de voir quelles ressources seront créées, modifiées ou détruites avant d'exécuter `terraform apply`. Cette commande est utile pour valider les changements à apporter à l'infrastructure.
