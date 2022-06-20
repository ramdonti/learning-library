# Setup Windows bastion host and Windows AD Domain Services

## Introduction

This lab walks you through the steps of how to create a Windows bastion host and set up the Windows Active Directory Domain Services in a Compute instance. It involves creating the Windows bastion host and Windows server in a Compute instance and installing and configuring the Microsoft Active Directory Domain Services.

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

1. Open the navigation menu, click **Compute**, and then click **Instances**.

  ![OCI compute instance](./images/create-instance-oci.png "OCI compute instance")

2. Compute page will be shown below. The Compute service helps you provision VMs and bare metal instances to meet your compute and application requirements.  Navigate to **Instances**, and then click on **Create Instance**.

  ![OCI compute instance create instance](./images/create-instance.png "OCI compute instance create instance")

3. Choose the Instance name and compartment where the compute instance needs to create and select the desired Availability Domain.

  ![OCI compute instance name](./images/create-instance-name.png "OCI compute instance name")

4. Click on **Change image** to select the edition of Windows image build and Click on **Change shape** to select the shape of the instance.

  ![OCI compute instance shape select](./images/create-instance-shape.png "OCI compute instance shape select")

5. Choose the compartment where the compute instance should reside and then choose the public subnet as shown in the below image. Click on assign a public IPv4 address to connect from the public internet.

  ![OCI compute instance VCN](./images/create-instance-comp.png "OCI compute instance VCN")

6. Choose the default values and click on the **Create** instance.

  ![OCI create compute instance](./images/create-instance-bootvolume.png "OCI create compute instance")

7. The Compute instance will be in a provisioning state shown in the below image.

  ![OCI create compute instance](./images/create-instance-provisioning.png "OCI create compute instance")

8. Once the compute instance is provisioned successfully, the instance state will be running state.

  ![OCI compute instance status](./images/create-instance-running.png "OCI compute instance status")

9. You can connect to the newly created instance via Remote Desktop using the **opc** username and the initial password shown in the console; the user must change the password at the next logon. The compute instance must allow RDP TCP port **3389** in the security list.

  ![OCI compute instance RDP username](./images/create-instance-userdetails.png "OCI compute instance RDP username")

  You may now **proceed to the next Task**.

##  Task 2: Create the Windows Domain Controller in Private Subnet

1. Open the navigation menu, click on **Compute**, and then click **Instances**.

  ![OCI compute instance](./images/create-instance-oci.png "OCI compute instance")

2. Navigate to **Instances**, and then click on **Create Instance**.

  ![OCI compute instance create instance](./images/create-instance.png "OCI compute instance create instance")

3. Choose the Instance name and compartment where the compute instance needs to be created and select the desired Availability Domain.

  ![OCI compute instance name](./images/create-instance-name-msdc.png "OCI compute instance name")

4. Click on **Change image** to select the required Windows image and click on **Change shape** to select the instance shape.

  ![OCI compute instance shape select](./images/create-instance-shape.png "OCI compute instance shape select")

5. Choose the compartment where the compute instance resides, and then choose the private subnet as shown in the below image. Since we have chosen a private subnet, the public IP address is selected as Do not assign a public IPv4 address automatically.

  ![OCI compute instance VCN](./images/create-instance-comp-msdc.png "OCI compute instance VCN")

6. Choose the default values and click on Create instance.

  ![OCI create compute instance](./images/create-instance-bootvolume.png "OCI create compute instance")

7. The Compute instance will be in a provisioning state shown in the below image.

  ![OCI compute instance status](./images/create-instance-provisioning-msdc.png "OCI compute instance status")

8. Once the compute instance provisioning is completed, you will be able to see the instance state is running.

  ![OCI compute instance status](./images/create-instance-running-msdc.png "OCI compute instance status")

9. You can connect to the newly created instance via Remote Desktop using the **opc** username and the initial password shown in the console; the user must change the password at the next logon. The compute instance must allow RDP TCP port **3389** in the security list.

  ![OCI compute instance RDP username](./images/create-instance-userdetails-msdc.png "OCI compute instance RDP username")

10. From the Bastion host server using the username **opc** and password, open the Remote Desktop and connect to the Domain Controller server using the private IP address.

11. From the taskbar, click **search button** and search for "run". Once the run command opens, type **lusrmgr.msc** to open the local users.

  ![Windows run command](./images/windows-run-command.png "Windows run command")

12. Once open, click on "Local Users and Groups". Click on **Users** and right-click on **Administrator** to set the password. The password reset is needed to run successful  **Prerequisites**  during the domain creation.

  ![Windows local users and groups wizard](./images/windows-command-lusrmgr.png "Windows local users and groups wizard")
  ![Windows local users and groups Administrator password reset](./images/windows-user-pass-reset.png "Windows local users and groups Administrator password reset")

13. From the task-bar click **search button** and search for Server Manager and click on Server Manager.

  ![Windows server manager search](./images/windows-command-search.png "Windows server manager search")

14. Click on **Add roles and features**.

  ![Windows server manager add roles and features](./images/windows-servermanager-addrole.png "Windows server manager add roles and features")

15. The Add Roles and Features Wizard look like the following image, and then click on **Next**.

  ![Windows server manager add roles and features wizard](./images/windows-servermanager-begin.png "Windows server manager add roles and features wizard")

16. Choose the Installation Type **Role-based or feature-based Installation**, and then click on **Next**.

  ![Windows server manager installation type](./images/windows-servermanager-installtype.png "Windows server manager installation type")

17. Choose the Server Selection Type **Select a server from the server pool**, and then click on **Next**.

  ![Windows server manager server selection](./images/windows-servermanager-serverselection.png "Windows server manager server selection")

18. Choose the Server Roles **Active Directory Domain Services**, click on **Add Features**, and then click on **Next**.

  ![Windows server manager server roles selection](./images/windows-servermanager-serverroles.png "Windows server manager server roles selection")

19. Select the features **Telnet Client**, which will be required to perform the ping test, and then click **next**.

  ![Windows server manager features selection](./images/windows-servermanager-featuresselect.png "Windows server manager features selection")

20. In the AD DS section, and then click on **next**.

    ![Windows server manager AD DS selection](./images/windows-servermanager-ADDS.png "Windows server manager AD DS selection")

21. The confirmation will show the details for roles, role services, or features on selected servers. Select **Restart the destination server automatically if required**. A pop-up will appear asking you to confirm the auto restart. Click **Install** to continue with the installation.

    ![Windows server manager confirmation](./images/windows-servermanager-restart.png "Windows server manager confirmation")

22. The **Results** section in the installation progress shows that the installation succeeded and the configuration required message, as shown in the image below, and then click **close**.

    ![Windows server manager progress results](./images/windows-servermanager-results.png "Windows server manager progress results")

23. Click the **search button** in the taskbar, search for "Server Manager," and click on "Server Manager." Click on the flag and click on **Promote the server to a domain controller**.

    ![Windows server manager promote the server to a domain controller](./images/windows-servermanager-prompt.png "Windows server manager promote the server to a domain controller")

24. From the **Deployment Configuration**, select **Add a new forest** and provide the desired domain name in **Root domain name:**, click on **Next**.

    ![Windows AD deployment configuration](./images/windows-servermanager-addnew.png "Windows AD deployment configuration")

25. In the **Domain Controller Options**, enter the **DSRM** password and click **Next**.

    ![Windows domain controller options](./images/windows-servermanager-dsrm.png "Windows domain controller options")

26. In the **DNS Options**, ignore the warning and click on **Next**.

    ![Windows DNS options](./images/windows-servermanager-dnsoptions.png "Windows DNS options")

27. The **NetBIOS domain name:** will resolve automatically, click on **Next**.

    ![Windows AD additional options](./images/windows-servermanager-netbios.png "Windows AD additional options")

28. choose the required paths for log files, click on **Next**.

    ![Windows AD log location](./images/windows-servermanager-logpath.png "Windows AD log location")

29. In the **Review Options** we can see the details settings, click on **Next**.

    ![Windows AD review configuration](./images/windows-servermanager-reviewoptions.png "Windows AD review configuration")

30. The configuration will verify the required prerequisites checks, as shown in the image below. Click **Install** to complete the installation.

    ![Windows AD prerequisites](./images/windows-servermanager-prerequisites.png "Windows AD prerequisites")

31. Once the server is configured with the domain controller, the system will be automatically restarted.

    ![Windows AD success](./images/windows-servermanager-dc.png "Windows AD success")

32. To verify the domain details, click the search button on the taskbar and type **dsa.msc** into the run command to open the Active Directory users and computers.

    ![Windows AD users and computers](./images/windows-command-dsa.png "Windows AD users and computers")

33. Open **Control Panel**, and navigate to   **Control Panel\System and Security\Windows Defender Firewall**.

    ![Control Panel\System and Security\Windows Defender Firewall](./images/windows-firewallbrowse.png "Control Panel\System and Security\Windows Defender Firewall")

34. In the **Customize settings**and choose the **Turn off Windows Firewall**, and then click on **OK** to apply the changes.

    ![Windows turn off firewall](./images/windows-firewall-customsettings.png "Windows turn off firewall")

35. To create domain Administrator users, go to the taskbar and search for the run command; once the run command opens, type **dsa.msc** to open the Active Directory users and computers, and then click on **users**.

    ![Create domain user](./images/windows-create-ad-account.png "Create domain user")

36. Provide the username details, and then click on **Next**.

    ![Create domain user details](./images/windows-create-ad-name.png "Create domain user details")

37. Provide the password and confirm the password, and then click on **Next**.

    ![Domain user password](./images/windows-create-ad-password.png "Domain user password")

38. Click on **Finish** to create the domain user.

    ![Domain user successful creation](./images/windows-create-ad-finish.png "Domain user successful creation")

39. Double click on the newly created user and click on **Member of**, and then add the **Domain Admins** and click on **Apply** to add the **Domain Admins** to the newly created user.

    ![Granting domain admins to users](./images/windows-create-ad-user-memberof.png "Granting domain admins to users")

    You may now **proceed to the next lab**.

## Learn More
- You can find more information about Launching a Windows Instance [here](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/launchinginstanceWindows.htm)


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, June 2022
