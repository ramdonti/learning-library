# Provision the Compute Instance from Market Place Image for SQL Server 2019

## Introduction

This lab walks you through the steps how to provision the Microsoft SQL Server 2019 from the Market Place Image in compute instance.


Estimated Time:  1 hour


### Objectives
In this lab, you will learn to :
* Deploy the Microsoft SQL Server 2019 from marketplace image
* Add the Computer Instances to Active Directory Domain Controller

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment
- Required Subnets are available in VCN

##  Task 1: Provision the SQL Server 2019 from Market Place for Node1

1. Open the navigation menu, click **Marketplace**, and then click **All Applications**

  ![](./images/compute-instance-oci.png " ")

2. Marketplace All Applications will be shown as below. Search for **SQL Server 2019** image and select the desired edition for SQL Server. We have Enterprise and Standard Edition are available.  Always On Basic Availability Groups provide a high availability solution for SQL Server from version 2016 and above on Standard Edition. A basic availability group supports a failover environment for a single database in Standard Edition.  

  ![](./images/compute-instance-marketplace.png " ")


3. Choose the compartment and click on **Launch Instance**, the screen will be take to the launch compute instance.

  ![](./images/compute-instance-compartment.png " ")

### Note: Please note that Minimum of 744 hours will be charged for SQL Server Marketplace image.

4. Choose the Instance name and compartment where the compute instance needs to created, select the desired Availability Domain.

  ![](./images/compute-instance-ad.png " ")

5. Click on **Change shape** to select the shape of the instance.

  ![](./images/compute-instance-shape.png " ")

6. Choose the compartment where the compute instance should resides, and then choose the private subnet as shown in below image.

  ![](./images/compute-instance-compart.png " ")

7. Choose the default values an click on **Create** instance

  ![](./images/compute-instance-default.png " ")

8. Once the compute instance provisioning completed we could able to see the instance state is running.

    ![](./images/compute-instance-provision.png " ")

##  Task 2: Provision the SQL Server 2019 from Market Place for Node2

* Repeat the all steps from Task 1 to provision the Microsoft SQL Server from Marketplace for Node2 in different private subnet.

##  Task 3:  Add the Node1 Server to Active Directory Domain

1. RDP to bastion host and login to the Node1 server using the private IP.

2. Open **Control Panel**, and navigate to **Network and Internet\Network and Sharing Center**

    ![](./images/windows-controlpanel.png " ")

3. Click on **Ethernet** connection, and then click on **properties**

    ![](./images/windows-network-ethernet.png " ")
4. Click on **IPv4**, and then click on **properties**.  Choose the **Use the following DNS Server Addresses:** and provide the private IP address of Domain which we built in Lab1, and click on **OK** to apply the changes.

    ![](./images/windows-network-ip.png " ")

5. Open the File Explorer and right click on **This PC**, and then click on **properties**
    ![](./images/windows-network-properties.png " ")

6. The following popup will be opened, and click on **Change Settings**

    ![](./images/windows-network-changesettings.png " ")

7. Click on **Computer Name**, and then click on **Change**, choose the **Domain** and provide the domain name, and click on **ok** to apply the changes.

    ![](./images/windows-network-changedomain.png " ")

8. The system will prompt for the domain administrator **username** and **password**. Provide the **domainname\username* and **password**, and then click on **ok** to apply the changes.

    ![](./images/windows-network-changepass.png " ")

9. On successful adding the server to the domain we can see the successful message as shown as below.

    ![](./images/windows-network-successful.png " ")

10. The system will ask for restart popup message on the screen, and then click on **ok** to reboot the system.

    ![](./images/windows-restart.png " ")

11. The system will prompt the popup on the screen, and then click on **Restart Now**.  

    ![](./images/windows-restart-popup.png " ")

12. After successful restart.  Perform the RDP connection to the server from the bastion host.  Open the **Control Panel**, and then navigate to **System and Security\System** to see the **full computer name**.

    ![](./images/windows-domain-verify.png " ")

##  Task 4:  Add the Node2 Server to Active Directory Domain

* Repeat the all steps from Task 3 to add the Node2 server to Active Directory Domain.

  You may now **proceed to the next lab.**
## Learn More
- You can find more information about Launching a Windows Instance [here](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/launchinginstanceWindows.htm)


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, April 2022
