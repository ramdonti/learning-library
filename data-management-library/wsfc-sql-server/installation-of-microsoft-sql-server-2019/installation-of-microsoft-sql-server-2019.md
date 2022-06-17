# Provision the Compute Instance from Market Place Image for SQL Server 2019

## Introduction

This lab walks you through the steps of how to provision the Microsoft SQL Server 2019 from the Market Place Image in compute instance.


Estimated Time:  1 hour


### Objectives
In this lab, you will learn to :
* Deploy the Microsoft SQL Server 2019 from the marketplace image
* Add the Computer Instances to Active Directory Domain Controller

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment
- Required Subnets are available in VCN

##  Task 1: Provision the SQL Server 2019 from Market Place for Node1

1. Open the navigation menu, click **Marketplace**, and then click **All Applications**

  ![OCI Marketplace](./images/compute-instance-oci.png " ")

2. Marketplace **All Applications** will be shown below. Search for **SQL Server 2019** image and select the desired edition for SQL Server. We have Enterprise and Standard Edition available.  Always On Basic Availability Groups provide a high availability solution for SQL Server from version 2016 and above on Standard Edition. A basic availability group supports a failover environment for a single database in Standard Edition.  

  ![Search SQL server](./images/compute-instance-marketplace.png " ")


3. Choose the compartment and click on **Launch Instance**, the screen will be taken to the launch compute instance.

  ![OCI launch instance](./images/compute-instance-compartment.png " ")

### Note: Please note that a minimum of 744 hours will be charged for the MS SQL Server Marketplace image.

4. Choose the Instance name and compartment where the compute instance needs to be created, and select the desired Availability Domain.

  ![OCI create compute instance](./images/compute-instance-ad.png " ")

5. Click on **Change shape** to select the shape of the instance.

  ![OCI compute instance shape](./images/compute-instance-shape.png " ")

6. Choose the compartment where the compute instance should reside, and then choose the private subnet as shown in the below image.

  ![OCI compute instance VCN](./images/compute-instance-compart.png " ")

7. Choose the default values and click on **Create** instance

  ![OCI compute instance boot volume](./images/compute-instance-default.png " ")

8. Once the compute instance provisioning is completed we could able to see the instance state is running.

    ![OCI compute instance status](./images/compute-instance-provision.png " ")

##  Task 2: Provision the SQL Server 2019 from Market Place for Node2

* Repeat all steps from Task 1 to provision the Microsoft SQL Server from Marketplace for Node2 in the different private subnet.

##  Task 3:  Add the Node1 Server to Active Directory Domain

1. RDP to bastion host and login to the Node1 server using the private IP.

2. Open **Control Panel**, and navigate to **Network and Internet\Network and Sharing Center**

    ![Windows network and sharing center](./images/windows-controlpanel.png " ")

3. Click on **Ethernet** connection, and then click on **properties**

    ![network and sharing ethernet properties](./images/windows-network-ethernet.png " ")
4. Click on **IPv4**, and then click on **properties**.  Choose the **Use the following DNS Server Addresses:** and provide the private IP address of the Domain which we built in Lab1, and click on **OK** to apply the changes.

    ![ethernet IP addresses](./images/windows-network-ip.png " ")

5. Open the File Explorer and right-click on **This PC**, and then click on **properties**
    ![Windows system properties](./images/windows-network-properties.png " ")

6. The following popup will be opened, and click on **Change Settings**

    ![Windows system change settings](./images/windows-network-changesettings.png " ")

7. Click on **Computer Name**, and then click on **Change**, choose the **Domain** and provide the domain name, and click on **ok** to apply the changes.

    ![Windows system name change](./images/windows-network-changedomain.png " ")

8. The system will prompt for the domain administrator **username** and **password**. Provide the **domainname\username* and **password**, and then click on **ok** to apply the changes.

    ![Domain credentials](./images/windows-network-changepass.png " ")

9. On successful adding the server to the domain we can see the successful message as shown below.

    ![Change in computer name](./images/windows-network-successful.png " ")

10. The system will ask for a restart popup message on the screen, and then click on **ok** to reboot the system.

    ![System restart popup message](./images/windows-restart.png " ")

11. The system will prompt the popup on the screen, and then click on **Restart Now**.  

    ![System restart](./images/windows-restart-popup.png " ")

12. After a successful restart.  Perform the RDP connection to the server from the bastion host.  Open the **Control Panel**, and then navigate to **System and Security\System** to see the **full computer name**.

    ![Computer name verification](./images/windows-domain-verify.png " ")

##  Task 4:  Add the Node2 Server to Active Directory Domain

* Repeat all steps from Task 3 to add the Node2 server to Active Directory Domain.

  You may now **proceed to the next lab.**
## Learn More
- You can find more information about Launching a Windows Instance [here](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/launchinginstanceWindows.htm)


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, April 2022
