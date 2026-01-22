# Terraform
Objectives
	• Introduction to laC 
	• Types of IaC Tools
	• Why  Terraform?
	• HCL Basics
	• Provision, Update and  Destroy
	• Providers
	• Input Variables
	• Output Variables
	• Resource Attributes
	• Resource Dependencies

Traditional Infrastructure :::

Once the Project confirm to our Organisation 
In traditional  infrastructure we can see so many team are involved to build our infra structure , here each and every step is manual method to build usually it will take time in each and every step it consume lot of time to deliver customer requirement .
   



Many Problems at Many stages in like -> Document step missing, issues , Outages those resources are not sync with other resource  

If we increase the resource to manage our infra , there it self we can see if one step missing in documentation every one will do same mistake in all environments .  

Scale Up and Down also not possible for manual configuration of infra structure 

Infrastructure as code (IaC)::  IaC tools allow you to manage infrastructure with configuration files rather than through a graphical 
user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.
 advantages using IaC tools :
			§ Deploy all infra using code 
			§ Reusability of code with minimal changes is important
			§ Changing values in manually in each file is time consuming and more error prone 

==========================Types of IaC Tools :::==============================================

Configuration management: 
	• tools commonly used to install and manage software on existing infrastructure resources such as servers , DB, Network devices …..etc.
	• Configuration management tolls maintains consistence and standard structure of code these makes easier to manage and updated as needed, also designed multiple resources at once .
	• An ansible Play book or Role can be checked in to a multiple repository  these allows us to reuse and distributed as needed.
	• Most important feature is IDEMPOTENT(we can run the code many times if any new changes then only implemented) eg: switch 
	• Here are the most popular tools ---> Ansible , Puppet and Salt Stack 
	
			
Server Templating tools:::
	• These can be used for creating custom images of a Virtual Machine or Containers 
	• These images already contains all required software's and dependences installed on them and for the most part, these eliminate the need of installing software after a VM /Container deployed .
	•  the most common example for server templated images are VM images such as those that are offered OS boxes.org and Custom images in amazon AMI , docker images on docker hub and other container registery .
	• These tools are Immutable infrastructure (Once Deployed it will not changed ) if we want to update the change we need to delete it and update the new change 
	
Provisioning tools ::
	• These tools are used to provisioning infrastructure components using a simple declarative code 
	• These infrastructure componenets can range from servers (such as VM's), DB, VPC's , Subnets, Security Groups, Storage …many more services
	• Cloud formation specifically used to deploy services in AWS     
			
Why terraform ..?
	• Terraform is a popular IaC tool which is specifically useful for the infrastructure provisioning tool ,
	• it a free and Opensource tool which is developed by HashiCorp organization, (now applied for licence for enterprise version )
	• it is installed as a single binary which can be set up very quickly allowing us to build, mange and destroy infrastructure in a mater of minutes 
	• Biggest advantage is Availibility to deploy infrastructure across multiple platforms including private and public cloud.
	• Terraform can manage so many resources (How does terraform can manage infrastructure on so many different kinds of platforms ..?) This is  achieved through providers , providers helps terraform to mange third party platforms through there API's , 
	• Providers enables terraform mange cloud platforms like AWS ,GCP, Azure as well as network infrastructures like Big IP , cloud flair ,DNS ,Palo Alto, Info blox as well as data management tools like data dog, Grafana, Auth0, Wave front, Sumo Logic and Data bases like Mango DB, MySQL, Postgres SQL …etc and version control system like GIT, GitHub, bitbucket .and many more providers      

 
Using Terraform has several advantages over manually managing your infrastructure:
		○ Terraform can manage infrastructure on multiple cloud platforms.
		○ The human-readable configuration language helps you write infrastructure code quickly.
		○ Terraforms state allows you to track resource changes throughout your deployments.
		○ You can commit your configurations to version control to safely collaborate on infrastructure.

HashiCorp Configuratation language ::: (HCL language )
	• Which is simple declarative language to define the infrastructure resources to be provision as blocks of code .
	• All infrastructure resources can be defined with configuratation file that has .tf (dot tf file extension )
	• The configuratation syntaxes easy to read and write and pick up for the beginner.
	• And also can be maintained in version control system .

In terraform the Code is declarative ..? What does declarative mean ..?
	The code we defined is the state that we want our infrastructure to be IN that is the desired state   
	Terraform will take care what is required to go from the current state to desired state with out having how to do 
How does terraform to do that ..?   
Terraform works in 3phases majorly 
	first phase ---> INIT  during init phase terraform initialize the project and identifies the providers to be used for the target environment  
	2nd phase ---> Plan during the Plan phase terraform drafts plan (shows the draft copy for us )to get to the target state .
	3rd Phase ---> Apply in the apply phase terraform makes the neccery changes required on the target environ to bring to desired state .
	
If for some reason the environment was to shift from desired state then subsequent terraform apply will bring it back to the desired state by only fixing the missing component
 
To deploy infrastructure with Terraform:
		Scope - Identify the infrastructure for your project.
		Author - Write the configuration for your infrastructure.
		Initialize - Install the plugins Terraform needs to manage the infrastructure.
		Plan - Preview the changes Terraform will make to match your configuration.
		Apply - Make the planned changes.
		
Track your infrastructure
Terraform keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.

	• Every objects that terraform manages is called as resource , a resource can be compute instance , a Data Base server in the cloud or in Physical server on On-premises   that terraform manages
	• Terraform manages the lifecycle of resources from provisioning to configuratation to decommissioning .
	• Terraform records the state of the infrastructure as it is seen in the real world and based on this it can determine what actions to take when updating resource for particular platform .
	• Terraform can ensure that the entire infrastructure is always would be desired/define state all times .
	• The state is blue print of the infrastructure deployed by the terraform , terraform can read attributes of existing infrastructure components by configuring data sources this can lead to read other resources with in the terraform .
	• Terraform can also import other resources out side of terraform - whether it is created by manually or by any IoC tools and brings it control
	• Terraform Cloud / Terraform Enterprice provide additional feature that allows simplified collaboration between team manageing infrastructure improved security and centralized UI to manage terraform deployments      

   




By using terraform we can manage our code in one place , we can Scale up and Down on demand basis 


Main Advantage using IaC with terraform 
	• Visibility - IaC serves as a very clear reference of what resources we created, and what their settings are. We don’t have to navigate to the web console to check the parameters.
	• Stability - If you accidentally change the wrong setting or delete the wrong resource in the web console you can break things. IaC helps solve this, especially when it is combined with version control, such as Git.
	• Scalability - With IaC we can write it once and then reuse it many times. This means that one well written template can be used as the basis for multiple services, in multiple regions around the world, making it much easier to horizontally scale.
	• Security - Once again IaC gives you a unified template for how to deploy our architecture. If we create one well secured architecture we can reuse it multiple times, and know that each deployed version is following the same settings.
	• Audit - Terraform not only creates resources it also maintains the record of what is created in real world cloud environments using its State files. 
<img width="902" height="6065" alt="image" src="https://github.com/user-attachments/assets/79444608-291a-4333-bcdb-5115c6a1cce9" />
