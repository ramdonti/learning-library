# Setup and Configure Always On Availability Group

## Introduction

This lab walks you through the steps to create the Always On Availability Group in SQL Server.

Estimated Time:  45 Minutes


### Objectives
In this lab, you will learn to :
* Create Sample database creation
* Enable Always On feature
* Create Always On Availability group
* Failover test of Always On Availability group

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment

##  Task 1: Create Sample Database

1. RDP to the Bastion host server using the username **.\opc** and password, from the Bastion host open the Remote Desktop and connect to the Node1 server using the private IP Address.
2. Open SSMS from **Windows Start Menu**, once opened choose the Servertype **Database Engine**, provide the Node1 server name, Choose the **Authentication** type windows Authentication, and then click on **Connect**

  ![](./images/lab4-image1.png " ")

3. Once we successfully connected to database engine, click on **New Query** and create the sample database using the following script, and then click on **Execute** command to create the sample database.  

    **Create database TestAOAG;**

  ![](./images/lab4-image2.png " ")

4. The database creation completed and shown as following image.
  ![](./images/lab4-image3.png " ")

5. ??
  ![](./images/lab4-image3a.png " ")

6. ??
  ![](./images/lab4-image3b.png " ")
You may now **proceed to the next lab**.

##  Task 2: Enable Always On feature for Node1 Database Engine and configure the SQL Engine services to run with Domain Users.

1. From the task bar click search button and search for **SQL Server 2019 Configuration Manager** and click on SQL Server 2019 Configuration Manager app.

  ![](./images/lab4-image4.png " ")

2. Right click on database Engine **SQL Server (MSSQLSERVER)**, and then click on **Properties**

  ![](./images/lab4-image5.png " ")

3. Click on **Always on Avilablity Groups** and select the check box **Enable Always on Availablity Groups**, and then click on Apply.

  ![](./images/lab4-image6.png " ")
4. The following **Warning** message will apper on the screen, and then click on **OK**.

  ![](./images/lab4-image7.png " ")

5. Finally click on **OK** to apply the changes.

  ![](./images/lab4-image8.png " ")
6. To apply the changes we need to restart the SQL Engine, Right click on database Engine **SQL Server (MSSQLSERVER)**, and then click Restart.

  ![](./images/lab4-image9.png " ")
7. To create the SQL service domain service account: From the task bar click search button and search for run, once the run command opens type **dsa.msc** to open the Active Directory users and computer, and then click on **users**

  ![](./images/lab4-task2-image9.png " ")

8. Provide the username details, and then click on **Next**.

  ![](./images/lab4-task2-image10.png " ")

9. Provide the password and confirm the password, and then click on **Next** and click on finish to close the create window.
  ![](./images/lab4-task2-image11.png " ")

10. From the task bar click search button and search for **SQL Server 2019 Configuration Manager** and click on SQL Server 2019 Configuration Manager app.

  ![](./images/lab4-image4.png " ")

11. Right click on database Engine **SQL Server (MSSQLSERVER)**, and then click on **Properties**

  ![](./images/lab4-image5.png " ")

12. Click on **Log On** and provide the user name and password created in above step, and then click on **apply** and **OK** to apply changes.

 ![](./images/lab4-task2-image12.png " ")

##  Task 3: Enable Always On feature for Node2 Database Engine and configure the SQL Engine services to run with Domain Users.

Repeat the all the steps from Task 2 to enable the **Always On feature for Node2**.

##  Task 4: Granting permissions to Virtual Computer Object

1. Ensure that you are logged in as a user that has permissions to create computer objects in the domain.

2. From the task bar click search button and search for run, once the run command opens type **dsa.msc** to open the Active Directory users and computer.

  ![](./images/lab4-Task4image1.png " ")

3. Click View and select **Advanced Features** to view the Advanced features  
  ![](./images/lab4-Task4image2.png " ")

4. Right click on Computers, select the **Properties**.
  ![](./images/lab4-Task4image3.png " ")

5. Click on **Security**, and then click on **Add**.

  ![](./images/lab4-Task4image4.png " ")

6. Click on **Object Types**

  ![](./images/lab4-Task4image5.png " ")

7. Select the check box **Computers**, and then click on **OK**

  ![](./images/lab4-Task4image6.png " ")

8. Search for the SQL Server Virtual computer name, and then click on **OK**.

  ![](./images/lab4-Task4image7.png " ")

9. select the computer and lick on **Advanced**

  ![](./images/lab4-Task4image8.png " ")


10. Click on **Edit** to edit the permissions

  ![](./images/lab4-Task4image9.png " ")

11. Choose the **Create Computer Objects** permission.

  ![](./images/lab4-Task4image10.png " ")

12. Click on **Apply** and click on **OK** to apply the changes.

  ![](./images/lab4-Task4image11.png " ")

13. Click on **Apply** and click **OK** to grant the permission to computer account.  

  ![](./images/lab4-Task4image12.png " ")

##  Task 5: Configure Always On Availability Group

1. Open SSMS from **Windows Start Menu**, once opened choose the Servertype **Database Engine**, provide the Node1 server name, Choose the **Authentication** type windows Authentication, and then click on **Connect**

  ![](./images/lab4-image1.png " ")

2. Navigate to **Always On High Availability**, then right click and then click on **New Availability Group Wizard**

  ![](./images/lab4-image10.png " ")
3. This screen shows the **Introduction** of setup Wizard
  ![](./images/lab4-image11.png " ")

4. In **Specify Options** provide the **Availability group name**, and then click on **Next**
  ![](./images/lab4-image12.png " ")
5. In **Select Databases** section select the database which we need to create.
  ![](./images/lab4-image13.png " ")
6. In **Specify Replicas**, click on **Replicas**, and then click on **Add Replica**, the setup will pop up **Connect to Server**
  ![](./images/lab4-image14.png " ")

7. click on **Connect**
  ![](./images/lab4-image15.png " ")

8. The **Replicas** screen shown as follows.
  ![](./images/lab4-image16.png " ")
9. In **Select Data synchronization**, and then select the **Automatic Seeding**
  ![](./images/lab4-image17.png " ")
10. The **Validation** screen shown as follows
  ![](./images/lab4-image18.png " ")
11. The **Summary** screen shows as follows
  ![](./images/lab4-image19.png " ")

12. The **Results** section shows **The wizard completed successfully** message as shown in the following image, and then click on **Close**
  ![](./images/lab4-image20.png " ")
13. Open the show dashboard by right on newly created on Availability group, we can see the successfully primary and read replica as shown as following image.

## Learn More
- ???  [here](https://docs.oracle.com/en-us/iaas/Content/SecurityAdvisor/Concepts/securityadvisoroverview.htm)


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, April 2022
