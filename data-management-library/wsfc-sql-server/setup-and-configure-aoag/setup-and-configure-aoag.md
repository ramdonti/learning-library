# Setup and Configure Always On Availability Group

## Introduction

This lab walks you through the steps to create the Always On Availability Group in SQL Server.

Estimated Time:  1 hour


### Objectives
In this lab, you will learn to :
* Create Sample database creation
* Enable the Always-on feature for SQL Server Engine
* Create Always On Availability group
* Failover test of Always On Availability group

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment

##  Task 1: Create Sample Database

1. RDP to the Bastion host server using the username **.\opc** and password, from the Bastion host open the Remote Desktop and connect to the Node1 server using the private IP Address.
2. Open SSMS from **Windows Start Menu**, once opened choose the Server type **Database Engine**, provide the Node1 server name, Choose the **Authentication** type Windows Authentication, and then click on **Connect**

  ![Microsoft SQL Server Management studio](./images/msql-managementstudio.png " ")

3. Once we successfully connected to the database engine, click on **New Query** and create the sample database using the following script, and then click on **Execute** command to create the sample database.  

    **Create database TestAOAG;**

  ![Microsoft SQL Server Management studio query](./images/msql-mgmtstudiocreatedb.png " ")

4. The database will be visible as shown in the following image.
  ![Microsoft SQL Server database details](./images/msql-mgmtstudiocreateview.png " ")

5. select **databases**, right click on newly created database, and then select **tasks**, choose **Backup**
  ![Microsoft SQL Server database backup](./images/msql-mgmtstudio-dbbackup.png " ")

6. choose the backup location and click on **ok**.
  ![Microsoft SQL Server database backup location](./images/msql-mgmtstudio-dbbackupconfirm.png " ")
You may now **proceed to the next lab**.

##  Task 2: Enable the Always-On feature for Node1 Database Engine and configure the SQL Engine services to run with Domain Users.

1. From the Windows taskbar, click the search button and search for **SQL Server 2019 Configuration Manager** and click on SQL Server 2019 Configuration Manager app.

  ![Windows search command](./images/mssql-configmanager-search.png " ")

2. Right-click on database Engine **SQL Server (MSSQLSERVER)**, and then click on **Properties**

  ![Microsoft SQL Server configuration manager ](./images/mssql-configmanager-dbservices.png " ")

3. Click on **Always on Availability Groups** and select the check box **Enable Always on Availability Groups**, and then click on Apply.

  ![Microsoft SQL Server engine properties](./images/mssql-configmanager-dbservices-properties.png " ")
4. The following **Warning** message will appear on the screen, and then click on **OK**.

  ![Microsoft SQL Server engine always on Availability groups](./images/mssql-configmanager-warring.png " ")

5. Finally click on **OK** to apply the changes.

  ![Microsoft SQL Server engine always on Availability groups](./images/mssql-configmanager-apply.png " ")
6. To apply the changes we need to restart the SQL Engine, Right-click on database Engine **SQL Server (MSSQLSERVER)**, and then click Restart.

  ![Microsoft SQL Server restart](./images/ms-sql-restart.png " ")
7. To create the SQL service domain service account: From the taskbar click the search button and search for the run command, once the run command opens type **dsa.msc** to open the Active Directory users and computer, and then click on **users**

  ![Windows AD users and computers](./images/windows-command-dsa.png " ")

8. Provide the username details, and then click on **Next**.

  ![Windows AD create users ](./images/mssql-serviceaccount-name.png " ")

9. Provide the password and confirm the password, and then click on **Next** and click on **Finish** to close the create window.
  ![Windows AD users details](./images/mssql-serviceaccount-password.png " ")

  ![Windows AD users password](./images/mssql-config-manager-search.png " ")

11. From the taskbar, click the search button and search for **SQL Server 2019 Configuration Manager** and click on SQL Server 2019 Configuration Manager app.

12. Right-click on database Engine **SQL Server (MSSQLSERVER)** and then click on **Properties**. Click on **Log On** and provide the user name and password created in the above step, and then click on **apply** and **OK** to apply changes.

 ![Microsoft SQL Server engine log on account](./images/mssql-configmanager-logon.png " ")

##  Task 3: Enable the Always-On feature for Node2 Database Engine and configure the SQL Engine services to run with Domain Users.

Repeat all the steps from Task 2 to enable the **Always On feature for Node2**.

##  Task 4: Grant permissions to Virtual Computer Object

1. Ensure that you are logged in as a user that has permission to create computer objects in the domain.

2. From the taskbar click the search button and search for the run, once the run command opens type **dsa.msc** to open the Active Directory users and computer.

  ![Windows AD users and computers](./images/windows-dsa.png " ")

3. Click View and select **Advanced Features** to view the Advanced features  
  ![Windows AD users and computers view](./images/windows-dsa-view.png " ")

4. Right click on Computers, select the **Properties**.
  ![Windows AD computer properties](./images/windows-dsa-computers.png " ")

5. Click on **Security**, and then click on **Add**.

  ![Windows AD computer security](./images/windows-dsa-security.png " ")

6. Click on **Object Types**

  ![Windows AD object types](./images/windows-dsa-objecttype.png " ")

7. Select the check box **Computers**, and then click on **OK**

  ![Windows AD object types select](./images/windows-dsa-serach-computer.png " ")

8. Search for the cluster name which we created in Lab 3: Task 5 and then click on **OK**.

  ![](./images/windows-dsa-computer-name.png " ")

9. select the cluster name and click on **Advanced**

  ![Windows cluster computer security settings](./images/windows-dsa-serach-computer-advan.png " ")


10. Click on **Edit** to edit the permissions

  ![Windows cluster computer advanced security settings](./images/windows-dsa-permissions.png " ")

11. Choose the **Create Computer Objects** permission.

  ![Windows cluster computer permissions](./images/windows-dsa-serach-computer-objects.png " ")

12. Click on **Apply** and click on **OK** to apply the changes.

  ![Windows cluster computer permissions](./images/windows-dsa-serach-computer-apply.png " ")

13. Click on **Apply** and click **OK** to grant permission to the computer account.  

  ![Windows cluster computer permissions apply](./images/windows-dsa-serach-computer-grant.png " ")

##  Task 5: Configure Always On Availability Group

1. Open SSMS from **Windows Start Menu**, once opened choose the Server type **Database Engine**, provide the Node1 server name, Choose the **Authentication** type Windows Authentication, and then click on **Connect**

  ![Microsoft sql server management studio](./images/msql-managementstudio.png " ")

2. Navigate to **Always On High Availability**, then right-click and then click on **New Availability Group Wizard**

  ![Microsoft sql server always on high availability](./images/mssql-aoag-newwizard.png " ")
3. This screen shows the **Introduction** of setup Wizard
  ![Microsoft sql server always on high availability wizard](./images/mssql-aoag-intro.png " ")

4. In **Specify Options** provide the **Availability group name**, and then click on **Next**
  ![Microsoft sql server always on high availability name](./images/mssql-aoag-name.png " ")
5. In **Select Databases** section select the database which we need to create.
  ![Microsoft sql server always on high availability primary DB](./images/mssql-aoag-selectdb.png " ")
6. In **Specify Replicas**, click on **Replicas**, and then click on **Add Replica**, the setup will pop up **Connect to Server**
  ![Microsoft sql server always on high availability read replica](./images/mssql-aoag-replica.png " ")

7. click on **Connect**
  ![Microsoft sql server always on high availability read replica connect](./images/mssql-aoag-secondnodeconnect.png " ")

8. The **Replicas** screen shown as follows.
  ![Microsoft sql server always on high availability read replicas](./images/mssql-aoag-replica-show.png " ")
9. In **Select Data synchronization**, and then select the **Automatic Seeding**
  ![Microsoft sql server always on high availability automatic seeding](./images/mssql-aoag-autoseeding.png " ")
10. The **Validation** screen shown as follows
  ![Microsoft sql server always on high availability validation](./images/mssql-aoag-validation.png " ")
11. The **Summary** screen shows as follows
  ![Microsoft sql server always on high availability Summary](./images/mssql-aoag-summary.png " ")

12. The **Results** section shows **The wizard completed successfully** message as shown in the following image, and then click on **Close**
  ![Microsoft sql server always on high availability wizard results](./images/mssql-aoag-result.png " ")
13. Open the show dashboard by right on newly created on Availability group, we can see the successfully primary and read replica as shown as following image.
  ![Microsoft sql server always on high availability dashboard](./images/mssql-aoag-dashboard.png " ")


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, June 2022
