# POC Workspace@II
Esse projeto tem como objetivo montar uma POC (Prova de Conceito) para o ambiente de trabalho das equipas de desenvolvimento. O mínimo para isso ocorrer, montamos a Workspace com as ferramentas:
* ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
* Glassfish
* SVN

## Hoje
Atualmente, o desenvolvimento é realizado em um ambiente Citrix remoto que fornece acesso a uma máquina virtual Windows 11. Dentro dessa máquina, o [Vagrant](https://www.vagrantup.com/) é usado para iniciar uma máquina virtual Linux com o ambiente de desenvolvimento completo, incluindo IDE (Eclipse ou IntelliJ), cliente SVN e servidor de aplicativos Glassfish 3. A base de dados Oracle é instalada fora da instância de desenvolvimento e é compartilhada por todos os projetos.
### Desvantagens
    * Alta latência: Existem latências significativas entre o Citrix e a VM Windows, entre a VM Windows e a VM Linux, e entre a IDE e o servidor de aplicativos, resultando em uma experiência de desenvolvimento lenta.
	* Ineficiência de recursos: A utilização de máquinas virtuais compartilhadas consome mais recursos do que containers, impactando negativamente o desempenho, especialmente em tarefas mais complexas como deploy de aplicações.
	* Segurança limitada: O acesso às fontes de código em máquinas virtuais, mesmo que virtuais, representa um risco de segurança.


## Pendencias / TO-DO

* Como pegar o utilizador de rede e nome do projeto para ao fazer o build, dar o nome com referencia?
* Antes de inicializar a Workspace: informar qual o projeto será utilizado para que seja feito o checkout no ambiente

## Preparação

> [ INFORMAR AQUI AS PRÉ-CONFIGURAÇÕES NECESSARIAS PARA INICIAR O AMBIENTE]

> [ INFORMAR O UTILIZADOR / INFORMAR O NOME DO PROJETO / INFORMAR O PERFIL (DEV ou BA) ]

<!-- Dentro do ficheiro ``devfile.yaml`` altere apenas no atributo VARIABLES os dados

* PROJECT_NAME: siglas do projeto
* UTILIZADOR: seu utilizador de rede
* PROFILE: Informe seu perfil (DEV / BA ) -->

## Criar Workspace

Possibilitamos ao desenvolvedor criar sua Workspace utilizando a IDE da sua preferência mas que contenha as ferramentas mínimas para seu desenvolvimento.

Por enquanto, a POC está preparada para funcionar com o:

[![IntelliJ IDEA](https://img.shields.io/badge/IntelliJIDEA-356FCD.svg?style=for-the-badge&logo=intellij-idea&logoColor=white)](https://workspaces.openshift.com#https://github.com/thallesdc/poc-vdi-ii?che-editor=che-incubator/che-idea/latest)


[![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-356FCD.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://workspaces.openshift.com#https://github.com/thallesdc/poc-vdi-ii?che-editor=che-incubator/che-code/latest)

> [PRECISAMOS PENSAR, POIS O II UTILIZA TAMBÉM:] <br/>

[![Eclipse](https://img.shields.io/badge/Eclipse-356FCD.svg?style=for-the-badge&logo=Eclipse&logoColor=white)](https://workspaces.openshift.com#https://github.com/thallesdc/poc-vdi-ii?che-editor=che-incubator/che-idea/latest)

[![NetBeans IDE](https://img.shields.io/badge/NetBeansIDE-356FCD.svg?style=for-the-badge&logo=apache-netbeans-ide&logoColor=white)](https://workspaces.openshift.com#https://github.com/thallesdc/poc-vdi-ii?che-editor=che-incubator/che-idea/latest)