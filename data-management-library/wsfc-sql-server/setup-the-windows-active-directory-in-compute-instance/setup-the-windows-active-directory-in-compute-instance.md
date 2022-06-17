# Setup Windows bastion host and Windows AD Domain Services

## Introduction

This lab walks you through the steps of how to create a Windows bastion host and set up the Windows Active Directory Domain Services in Compute instance. It involves creating the windows bastion host and Windows server in Compute instance and installing and configuring the Microsoft Active Directory Domain Services.

Estimated Time:  1 Hour 30 min


### Objectives
In this lab, you will learn to :
* Setup the Windows bastion host
* Setup the Windows Active Directory Domain Services in Compute instance

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment
- Required Subnets are available in VCN

##  Task 1: Create the Bastion host in Public Subnet

1. Open the navigation menu, click **Compute**, and then click **Instances**

  ![OCI compute instance](./images/create-instance-oci.png " ")

2. Compute page will be shown below. The Compute service helps you provision VMs and bare metal instances to meet your compute and application requirements.  Navigate to **Instances**, and then click on **Create Instance**

  ![OCI compute instance create instance](./images/create-instance.png " ")

3. Choose the Instance name and compartment where the compute instance needs to create and select the desired Availability Domain.

  ![OCI compute instance name](./images/create-instance-name.png " ")

4. Click on **Change image** to select the edition of Windows image build and Click on **Change shape** to select the shape of the instance.

  ![OCI compute instance shape select](./images/create-instance-shape.png " ")

5. Choose the compartment where the compute instance, should reside and then choose the public subnet as shown in the below image. Click on assign a public IPv4 address to connect from the public internet.

  ![OCI compute instance VCN](./images/create-instance-comp.png " ")

6. Choose the default values and click on **Create** instance

  ![OCI create compute instance](./images/create-instance-bootvolume.png " ")

7. The Compute instance will be in a provisioning state as shown in the below image.

  ![OCI compute instance status](./images/create-instance-provisioning.png " ")

8. Once the compute instance provisioning is completed we could able to see the instance state is running.

  ![OCI compute instance status](./images/create-instance-running.png " ")

9. We can use the Remote Desktop to connect to the newly created instance using the **opc** username and with the initial password shown in the console.  We need to change the password at the first login. The network that the instance is in must allow RDP TCP port **3389** in the security list.

  ![OCI compute instance RDP username](./images/create-instance-userdetails.png " ")

  You may now **proceed to the next Task**.

##  Task 2: Create the Windows Domain Controller in Private Subnet

1. Open the navigation menu, click on **Compute**, and then click **Instances**

  ![OCI compute instance](./images/create-instance-oci.png " ")

2. Compute page will be shown below. The Compute service helps you provision VMs and bare metal instances to meet your compute and application requirements.  Navigate to **Instances**, and then click on **Create Instance**

  ![OCI compute instance create instance](./images/create-instance.png " ")

3. Choose the Instance name and compartment where the compute instance needs to be created and select the desired Availability Domain.

  ![OCI compute instance name](./images/create-instance-name-msdc.png " ")

4. Click on **Change image** to select the edition of Windows image build and Click on **Change shape** to select the shape of the instance.

  ![OCI compute instance shape select](./images/create-instance-shape.png " ")

5. Choose the compartment where the compute instance resides, and then choose the private subnet as shown in the below image. Since we have chosen a private subnet the Public IP address is selected as Do not assign a public IPv4 address automatically which cannot change as shown in the below image.

  ![OCI compute instance VCN](./images/create-instance-comp-msdc.png " ")

6. Choose the default values and click on Create instance

  ![OCI create compute instance](./images/create-instance-bootvolume.png " ")

7. The Compute instance will be in a provisioning state as shown in the below image.

  ![OCI compute instance status](./images/create-instance-provisioning-msdc.png " ")

8. Once the compute instance provisioning is completed we could able to see the instance state is running.

  ![OCI compute instance status](./images/create-instance-running-msdc.png " ")

9. We can use the Remote Desktop to connect to the newly created instance using the **opc** username and with the initial password shown in the console.  We need to change the password at the first login. The network that the instance is in must allow RDP TCP port **3389** in the security list.

  ![OCI compute instance RDP username](./images/create-instance-userdetails-msdc.png " ")

10. RDP to the Bastion host server using the username **opc** and password, from the Bastion host open the Remote Desktop and connect to the Domain Controller server using the private IP Address.

11. From the task-bar click **search button** and search for **run**, once the run command opens type **lusrmgr.msc** to open the local users.

  ![Windows run command](./images/windows-run-command.png " ")

12. once open the **Local users and Groups**, click on **Users** and right lick on **Administrator** to set the password. This password reset is needed to run the **Prerequisites** successfully during the Domain creation.

  ![Windows local users and groups wizard](./images/windows-command-lusrmgr.png " ")
  ![Windows local users and groups Administrator password reset](./images/windows-user-pass-reset.png " ")

13. From the task-bar click **search button** and search for Server Manager and click on Server Manager.

  ![Windows server manager search](./images/windows-command-search.png " ")

14. To successfully open the Server Manager, click on **Add roles and features**

  ![Windows server manager add roles and features](./images/windows-servermanager-addrole.png " ")

15. The Add Roles and Features Wizard looks like the following image, click on **next**

  ![Windows server manager add roles and features wizard](./images/windows-servermanager-begin.png " ")

16. Choose the Installation Type **Role-based or feature-based Installation**, click on **next**

  ![Windows server manager installation type](./images/windows-servermanager-installtype.png " ")

17. Choose the Server Selection Type **Select a server from the server pool**, click on **next**

  ![Windows server manager server selection](./images/windows-servermanager-serverselection.png " ")

18. Choose the Server Roles **Active Directory Domain Services**, click on **Add Features**, click on **next**

  ![Windows server manager server roles selection](./images/windows-servermanager-serverroles.png " ")

19. Choose the Features **Telnet Client**, Telnet client will be required to do the ping test, click on **next**

  ![Windows server manager features selection](./images/windows-servermanager-featuresselect.png " ")

20. In the AD DS section, click on **next**

    ![Windows server manager AD DS selection](./images/windows-servermanager-ADDS.png " ")

21. The Confirmation will show the details for roles, role services, or features on selected servers, choose the **Restart the destination server automatically if required**, a pop up will appear to check on **yes** for auto restart, click on **Install** to proceed with the installation.

    ![Windows server manager confirmation](./images/windows-servermanager-restart.png " ")

22. In the Installation progress **Results** section shows that the installation succeeded and the configuration required message as shown in the below image, click on **close**

    ![Windows server manager progress results](./images/windows-servermanager-results.png " ")

23. From the task-bar click **search button** and search for Server Manager and click on Server Manager. Click on the Flag and click on **Promote the server to a domain controller**

    ![Windows server manager promote the server to a domain controller](./images/windows-servermanager-prompt.png " ")

24. From the **Deployment Configuration**, select **Add a new forest** and provide the desired domain name in **Root domain name:**, click on **next**  

    ![Windows AD deployment configuration](./images/windows-servermanager-addnew.png " ")

25. In the **Domain controller Options**, provide the password for **DSRM**, click on **next**

    ![Windows domain controller options](./images/windows-servermanager-dsrm.png " ")

26. In the **DNS Options**, ignore the warning and click on **next**

    ![Windows DNS options](./images/windows-servermanager-dnsoptions.png " ")

27. The **NetBIOS domain name:** will resolve automatically, click on **next**

    ![Windows AD additional options](./images/windows-servermanager-netbios.png " ")

28. choose the required paths for log files, click on **next**

    ![Windows AD log location](./images/windows-servermanager-logpath.png " ")

29. In the **Review Options** we can see the details settings, click on **next**

    ![Windows AD review configuration](./images/windows-servermanager-reviewoptions.png " ")

30. In the **Prerequisites** section, click on **next** the configuration will verify the required Prerequisites checks, the successful Prerequisites checks show as below image, click on **Install** to complete the installation.

    ![Windows AD prerequisites](./images/windows-servermanager-prerequisites.png " ")

31. Once the server is configured with the domain controller, we can see the successful message as shown in the below image and the system is automatically restarted.

    ![Windows AD success](./images/windows-servermanager-dc.png " ")

32. To verify the domain details, from the taskbar click the search button and search for the run button, once the run command opens type **dsa.msc** to open the Active Directory users and computer.

    ![Windows AD users and computers](./images/windows-command-dsa.png " ")

33. Open **Control Panel**, and navigate to   **Control Panel\System and Security\Windows Defender Firewall**

    ![Control Panel\System and Security\Windows Defender Firewall](./images/windows-firewallbrowse.png " ")

34. In the **Customize settings**and choose the **Turn off Windows Firewall**, and then click on **OK** to apply the changes.

    ![Windows turn off firewall](./images/windows-firewall-customsettings.png " ")

35. To create the domain Administrator users: From the task-bar click the search button and search for the run command, once the run command opens type **dsa.msc** to open the Active Directory users and computer, and then click on **users**

    ![Create domain user](./images/windows-create-ad-account.png " ")

36. Provide the username details, and then click on **Next**.

    ![Create domain user details](./images/windows-create-ad-name.png " ")

37. Provide the password and confirm the password, and then click on **Next**.

    ![Domain user password](./images/windows-create-ad-password.png " ")

38. Click on **Finish** to create the domain user.

    ![Domain user successful creation](./images/windows-create-ad-finish.png " ")

39. Double Click on the newly created user and click on **Member of**, and then add the **Domain Admins** and click on **Apply** to add the **Domain Admins** to the newly created user.

    ![Granting domain admins to users](./images/windows-create-ad-user-memberof.png " ")

You may now **proceed to the next lab**.

## Learn More
- You can find more information about Launching a Windows Instance [here](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/launchinginstanceWindows.htm)


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, June 2022
