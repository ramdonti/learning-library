# Setup the 2 node Windows Server Failover Cluster

## Introduction

This lab walks you through the steps to create a Windows Server Failover Cluster.

A failover cluster is a group of independent computers that work together to increase the availability and scalability of clustered roles.

Estimated Time:  1 hour


### Objectives
In this lab, you will learn to :
* How to install the Failover Clustering features on Windows server
* How to create the secondary Private IPs for Computer instance VNICS
* How to configure the 2 node Windows Failover Cluster

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment

##  Task 1: Install Failover Clustering features in Node1

1. RDP to the Bastion host server using the username **.\opc** and password, from the Bastion host open the Remote Desktop and connect to the Node1 server using the private IP Address.

2. From the taskbar click **search button** and search for Server Manager and click on Server Manager.

  ![](./images/windows-command-search.png " ")

Launch Add Roles and Feature Wizard from the server manager. Enable the **Failover Clustering** feature in both the SQL nodes.

3. To successful open the Server Manager, click on **Add roles and features**

  ![](./images/windows-servermanager-add.png " ")

4. The Add Roles and Features Wizard looks like the following image, click on **next**

  ![](./images/windows-servermanager-begin.png " ")

5. Choose the Installation Type **Role-based or feature-based Installation**, click on **next**

  ![](./images/windows-servermanager-installtype.png " ")

6. Choose the Server Selection Type **Select a server from the server pool**, click on **next**

  ![](./images/windows-servermanager-serverselection.png " ")

7. Put a tick mark on **Failover Clustering** and click on **Add Features** to install the feature with dependency.

  ![](./images/windows-servermanager-features.png " ")

  Click on **Next** to continue with the installation.

  ![](./images/windows-servermanager-features-install.png " ")

8. The Confirmation will show the details for roles, role services, or features on selected servers, choose the **Restart the destination server automatically if required**, a pop up will appear to check on **yes** for auto restart, click on **Install** to proceed with the installation.

  ![](./images/windows-servermanager-confirmation.png " ")

9. In Installation progress **Results** section shows that the installation succeeded.

  ![](./images/windows-servermanager-results.png " ")

10. To verify the failover cluster services, From the task bar click **search button** and search for **Failover Cluster

  ![](./images/windows-command-fcm.png " ")

  The **Failover Cluster Manager** opens as shown in the following image.

  ![](./images/windows-command-fcmanager.png " ")

##  Task 2: Install Failover Clustering features in Node2

* Repeat the all steps from **Task 1** to install **Failover Clustering features** in Node2

## Task 3: Create Secondary Private IPs for Node1

Add two secondary IPs for each node. One is used for Windows Server Failover Clustering, and the other will be used for Always On Availability group listener.

1. Open the navigation menu, click Compute, and then click Instances

  ![](./images/compute-instance-oci.png " ")

2. Click on the **Compute Instance** which we need to add the secondary IPs.

  ![](./images/compute-instance-selectinstance.png " ")

3. In the **Resource** section, click on **Attached VNICs**, and then click on Primary VNIC to add the secondary IPs.

  ![](./images/compute-instance-nic.png " ")

4. Once VNIC is opened, click on **IPv4 Address**.

  ![](./images/compute-instance-ipv.png " ")

5. The **IPv4 Address** show the Primary IP address details, and then click on **Assign Secondary Private IP Address**

  ![](./images/compute-instance-ipv-secondary.png " ")

6. Click on **Assign** will automatically assign the available private IP.  Repeat the same step again to assgin another private IP.

  ![](./images/compute-instance-ipv-assign.png " ")

7. In **IPv4 Addresses** Section we can able to see one Primary IP and two secondary IP addresses as shown in the following image.

  ![](./images/compute-instance-ipvdetail.png " ")

## Task 4: Create Secondary Private IPs for Node2

Repeat the all steps from **Task 3** to add secondary IPs for Node2 VNICS

## Task 5:  Configure the 2 node Windows Failover Cluster

1. RDP to the Bastion host server using the username **use the testadmin user which is created in lab 1, Task 2 in step 35** and password, from the Bastion host, open the Remote Desktop and connect to the Node1 server using the private IP Address.

2. From the taskbar click **search button** and search for **Failover Cluster**

  ![](./images/windows-command-search.png " ")

  The **Failover Cluster Manager** open as shown in the following image, and then right-click **Failover Cluster Manager**, and click on **Create Cluster**

  ![](./images/windows-fcm-create.png " ")

3. The **Cluster Wizard** is shown in the following image, then click on **Next**

  ![](./images/windows-fcm-begin.png " ")

4. Click on Browse and search for the two servers which we created in **Lab 2**
  ![](./images/windows-fcm-selectservers.png " ")

5. After you add the two servers it will show as below, and then click on **Next**
  ![](./images/windows-fcm-name.png " ")
6. In the Validation warning section select **yes**, and then click on **Next**
  ![](./images/windows-fcm-validation.png " ")

7. The validation configuration wizard shown as follows, and then click on **Next** to continue validation
  ![](./images/windows-fcm-config-validation.png " ")

8. In **Testing Options** tab choose the **Run all tests (recommended)** option, and then click on **Next**

  ![](./images/windows-fcm-testing.png " ")

9. The confirmation screen shows all servers which we added to cluster validation, and then click on **Next**

  ![](./images/windows-fcm-confirmationtest.png " ")

10. The validation will run a test.

  ![](./images/windows-fcm-confirmationtestrun.png " ")

11. Once the validation is completed we can see the status as **Validated** and we can click on **View Report** to view the complete report in **Html** format.

  ![](./images/windows-fcm-configvalidationrun.png " ")

12. In **Access Point for Administering the Cluster** choose the **Cluster Name**, and then click on **Next**

  ![](./images/windows-fcm-summary.png " ")

13. The **Confirmation** screen shows the cluster name, node details and another few domain related information, and then click on **Next** to continue with the configuration.
  ![](./images/windows-fcm-clustername.png " ")

14. Once the cluster is created successfully we can see the confirmation that **You have successfully completed the Create Cluster Wizard** message as shown follows.
  ![](./images/windows-fcm-successful.png " ")

15. After successfully creating the cluster, the cluster details are shown as follows.

  ![](./images/windows-fcm-clusterdetails.png " ")

16. Select the Cluster and navigate to **Cluster Core Resources**, the cluster resource will show is offline as shown in the following image.  To bring the cluster online we need to update the **Static IP Address** which we created in **Task 3** and **Task4**.
  ![](./images/windows-fcm-clustercoreservices.png " ")

17. Right-click on **IP Address on Cluster Network 1**, and then click on **Properties**.  Select the Static IP Address and provide the secondary IP address which we created in **Task 3** for node1.
  ![](./images/windows-fcm-staticip.png " ")

18. Repeat the same above step for the Node2 network.
  ![](./images/windows-fcm-staticip-secondnode.png " ")

19. Once the static secondary IP are configured, and then right lick on SQLName and click on **Bring online** cluster.
  ![](./images/windows-fcm-bringonline.png " ")

20. The cluster should come online as shown in the following image. Since the cluster is a multi-subnet cluster we can able to see only one network is online.
  ![](./images/windows-fcm-clusteronlinestatus.png " ")

With the above step, we are successfully set up the windows 2 node failover cluster. You may now **proceed to the next lab**.


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, June 2022
