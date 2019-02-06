# project-website
This is the repository where our project landing page will be maintained. This is not the website for our actual application. 

## [Setup](#setup)
This repository is setup to host a GitHub Pages site. This site can be accessed at: [uw-thalesians.github.io/project-website](https://uw-thalesians.github.io/project-website). Please note, when sharing a link to this site, please share [uw-thalesians.github.io/project-website](https://uw-thalesians.github.io/project-website) as this is the persistent link. After January 2020, the domain perceptia.info will expire and this website will only be accessible from [uw-thalesians.github.io/project-website](https://uw-thalesians.github.io/project-website). This site will resolve to www.capstone.perceptia.info. 

After June 2019, the subdomain hosting for this GitHub Pages site should be removed. 

GitHub Pages is served from /docs directory in the master branch. You should not edit files in the /docs directory directly. You will notice that there is a file named "CNAME" in this directory. Do not edit or remove this file. This file is used by github to associate our gh-pages site with our custom domain name. Note: GitHub Pages is a static site hosting service and doesn't support server-side code such as, PHP, Ruby, or Python.

Currently, this site's content is developed in the simple-site subdirectory. Please see the section below entitled [Simple-Site Setup and Use](#simple-site-setup-and-use)

## [Simple-Site Setup and Use](#simple-site-setup-and-use)
The files located in the subdirectory simple-site/src are the source files that should be deployed as is to the subdirectory docs. A PowerShell script has been written to automatically copy the files in simple-site/src to the docs folder. Note, by default this script will not run if there are any files in the docs folder. The only exception is the CNAME files which should not be deleted. See the [Setup](#setup) section for more on the CNAME file. 

To run the script type:

`PS C:\path\to\repo\clone\project-website\simple-site\> .\deploy-to-docs.ps1`

Note, if you have not already enabled running unsigned PowerShell scripts you will need to do so in order to run this script. 

If you would like to deploy the files in src to docs without having to manually delete the files already in docs, add the flag `-Clean` to the command. This will remove all files in docs except the CNAME file.

`PS C:\path\to\repo\clone\project-website\simple-site\> .\deploy-to-docs.ps1 -Clean`

## [Azure Boards Integration](#azure-boards-integration)
To have commits and PRs for this repository appear as a link in an ADO work-item you have to use a specific syntax in your commit and PR messages. Read more about this proccess [here.](https://docs.microsoft.com/en-us/azure/devops/boards/github/link-to-from-github?view=vsts)

Note, in order for ADO to know to watch for the Azure Board tag, the repository must already be selected as a connection in the [ADO prject settings.](https://dev.azure.com/uw-thalesians/Capstone%202019/_settings/boards-external-integration) Instructions for how to set this up can be found [here.](https://docs.microsoft.com/en-us/azure/devops/boards/github/index?view=vsts) 

### [Commit Format](#commit-format)
AB#{ID}

If you include the above, where {ID} is replaced with the work-item id from ADO, in your commit or PR, the coresponding ADO work-item will attach a link to the commit or PR to the work-item. Note, there are additional keywords that ADO will watch for in a commit message with the AB#{ID} format, and take specific actions. See [here](https://docs.microsoft.com/en-us/azure/devops/boards/github/link-to-from-github?view=vsts) for more information.  

## [Public Repository Security Considerations](#public-repository-security-considerations)
This is a public repository. Do no store any sensitive information in this repository, such as secure API access tokens, certificates, private keys, etc. If your build process depends on this content, be sure to add the file to the .gitignore before saving it to the local clone of the repository, or load the information by an envirnment variable. At this time there is not an agreed upon location to store this information. (Suggestion: Team Drive Folder).
