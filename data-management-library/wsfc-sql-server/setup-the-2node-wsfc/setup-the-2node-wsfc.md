# In Compute Instance, create a two-node Windows Server Failover Cluster.

## Introduction

This lab walks you through the steps to create a Windows Server Failover Cluster.

A failover cluster is a group of independent computers that work together to increase the availability and scalability of clustered roles.

Estimated Time:  1 hour


### Objectives
In this lab, you will learn to :
* How to install the Failover Clustering features on the Windows server
* How to create the secondary Private IPs for Computer instance VNICS
* How to configure the 2 node Windows Failover Cluster

### Prerequisites  

This lab assumes you have:
- A Free or LiveLabs Oracle Cloud account
- IAM policies to create resources in the compartment

##  Task 1: Install Failover Clustering features in Node1

1. Open the Remote Desktop client on the Bastion host and connect to the Node1 server using the private IP address using the **opc** user.

2. Click the **search button** in the taskbar and search for Server Manager, then click on Server Manager.

  ![Windows command Search server manager](./images/windows-command-search.png "Windows command Search server manager")

3. Click on **Add roles and features**.

  ![Server manager add roles ad features](./images/windows-servermanager-add.png "Server manager add roles ad features")

4. The Add Roles and Features Wizard look like the following image. Click on **Next**.

  ![Server manager roles and features](./images/windows-servermanager-begin.png "Server manager roles and features")

5. Choose the Installation Type **Role-based or feature-based Installation**, click on **Next**

  ![Server manager installation type](./images/windows-servermanager-installtype.png "Server manager installation type")

6. Choose the Server Selection Type **Select a server from the server pool**, click on **Next**

  ![Server manager server pool](./images/windows-servermanager-serverselection.png "Server manager server pool")

7. Put a tick mark on **Failover Clustering** and click on **Add Features** to install the feature with dependency.

  ![Server manager features selection](./images/windows-servermanager-features.png "Server manager features selection")

  Click on **Next** to continue with the installation.

  ![Server manager features failover clustering](./images/windows-servermanager-features-install.png "Server manager features failover clustering")

8. The Confirmation will show the details for roles, role services, or features on selected servers, choose the **Restart the destination server automatically if required**, a pop up will appear to check on **yes** for auto restart, click on **Install** to proceed with the installation.

  ![Server manager features installation confirmation](./images/windows-servermanager-confirmation.png "Server manager features installation confirmation")

9. In Installation progress **Results** section shows that the installation succeeded.

  ![Server manager features failover clustering installation results](./images/windows-servermanager-results.png "Server manager features failover clustering installation results")

10. To verify the failover cluster services, From the taskbar click **search button** and search for **Failover Cluster**

  ![Windows command search failover cluster manager](./images/windows-command-fcm.png "Windows command search failover cluster manager")

  The **Failover Cluster Manager** opens as shown in the following image.

  ![Windows failover cluster manager wizard](./images/windows-command-fcmanager.png "Windows failover cluster manager wizard")

##  Task 2: Install Failover Clustering features in Node2

* Repeat the all steps from **Task 1** to install **Failover Clustering features** in Node2

## Task 3: Create Secondary Private IPs for Node1

  Add two secondary IPs for each node. One is used for Windows Server Failover Clustering, and the other will be used for the Always-On Availability group listener.

1. Open the navigation menu, click Compute, and then click instances.

  ![OCI compute instance](./images/compute-instance-oci.png "OCI compute instance")

2. Click on the **Compute Instance** to add the secondary IPs.

  ![OCI compute instance](./images/compute-instance-selectinstance.png "OCI compute instance")

3. In the **Resource** section, click on **Attached VNICs**, and then click on Primary VNIC to add the secondary IPs.

  ![OCI compute instance attached VNICs](./images/compute-instance-nic.png "OCI compute instance attached VNICs")

4. Once VNIC is opened, click on **IPv4 Address**.

  ![OCI compute instance attached VNICs IP](./images/compute-instance-ipv.png "OCI compute instance attached VNICs IP")

5. The **IPv4 Address** show the Primary IP address details, and then click on **Assign Secondary Private IP Address**

  ![OCI compute instance attached VNICs secondary IP](./images/compute-instance-ipv-secondary.png "OCI compute instance attached VNICs secondary IP")

6. Click on **Assign** will automatically assign the available private IP.  Repeat the same step to assign another private IP.

  ![OCI compute instance attached VNICs secondary private IP](./images/compute-instance-ipv-assign.png "OCI compute instance attached VNICs secondary private IP")

7. In **IPv4 Addresses** Section we can able to see one Primary IP and two secondary IP addresses as shown in the following image.

  ![OCI compute instance attached VNICs secondary private IPs](./images/compute-instance-ipvdetail.png "OCI compute instance attached VNICs secondary private IPs")

## Task 4: Create Secondary Private IPs for Node2

* Repeat the all steps from **Task 3** to add secondary IPs for Node2 VNICS

## Task 5:  Configure the 2 node Windows Failover Cluster

1. RDP to the Bastion host server using the username **use the testadmin user which is created in lab 1, Task 2 in step 35** and password, from the Bastion host, open the Remote Desktop and connect to the Node1 server using the private IP Address.

2. From the taskbar click **search button** and search for **Failover Cluster**

  ![Windows search command](./images/windows-command-search.png "Windows search command")

  The **Failover Cluster Manager** open as shown in the following image, and then right-click **Failover Cluster Manager**, and click on **Create Cluster**.

  ![Windows create failover cluster](./images/windows-fcm-create.png "Windows create failover cluster")

3. The **Cluster Wizard** is shown in the following image, then click on **Next**.

  ![Windows create cluster wizard](./images/windows-fcm-begin.png "Windows create cluster wizard")

4. Click on Browse and search for the two servers which we created in **Lab 2**.

  ![Windows cluster wizard select servers](./images/windows-fcm-selectservers.png "Windows cluster wizard select servers")

5. After you add the two servers it will show as below, and then click on **Next**.

  ![Windows cluster wizard select servers](./images/windows-fcm-name.png "Windows cluster wizard select servers")

6. In the Validation warning section select **yes**, and then click on **Next**.

  ![Windows cluster wizard validation warning check](./images/windows-fcm-validation.png "Windows cluster wizard validation warning check")

7. The validation configuration wizard shown as follows, and then click on **Next** to continue validation.

  ![Windows cluster wizard validation testing](./images/windows-fcm-config-validation.png "Windows cluster wizard validation testing")

8. In **Testing Options** tab choose the **Run all tests (recommended)** option, and then click on **Next**.

  ![Windows cluster wizard validation testing options](./images/windows-fcm-testing.png "Windows cluster wizard validation testing options")

9. The confirmation screen shows all servers which we added to cluster validation, and then click on **Next**.

  ![Windows cluster wizard validation testing confirmation](./images/windows-fcm-confirmationtest.png "Windows cluster wizard validation testing confirmation")

10. The validation will run a test.

  ![Windows cluster wizard validation test run](./images/windows-fcm-confirmationtestrun.png "Windows cluster wizard validation test run")

11. Once the validation is completed we can see the status as **Validated** and we can click on **View Report** to view the complete report in **Html** format.

  ![Windows cluster wizard validation test results](./images/windows-fcm-configvalidationrun.png "Windows cluster wizard validation test results")

12. In **Access Point for Administering the Cluster** choose the **Cluster Name**, and then click on **Next**.

  ![Windows cluster name](./images/windows-fcm-summary.png "Windows cluster name")

13. The **Confirmation** screen shows the cluster name, node details and another few domain-related information, and then click on **Next** to continue with the configuration.

  ![Windows cluster name conformation](./images/windows-fcm-clustername.png "Windows cluster name conformation")

14. Once the cluster is created successfully we can see the confirmation that **You have completed the Create Cluster Wizard** message as shown follows.
  ![Windows cluster creation results](./images/windows-fcm-successful.png "Windows cluster creation results")

15. After successfully creating the cluster, the cluster details are shown as follows.

  ![Windows cluster wizard](./images/windows-fcm-clusterdetails.png "Windows cluster wizard")

16. Select the Cluster and navigate to **Cluster Core Resources**, the cluster resource will show is offline as shown in the following image.  To bring the cluster online we need to update the **Static IP Address** which we created in **Task 3** and **Task4**.

  ![Windows cluster server name](./images/windows-fcm-clustercoreservices.png "Windows cluster server name")

17. Right-click on **IP Address on Cluster Network 1**, and then click on **Properties**.  Select the Static IP Address and provide the secondary IP address which we created in **Task 3** for node1.

  ![Windows cluster network static ip](./images/windows-fcm-staticip.png "Windows cluster network static ip")

18. Repeat the same above step for the Node2 network.

  ![Windows cluster network static ip](./images/windows-fcm-staticip-secondnode.png "Windows cluster network static ip")

19. Once the static secondary IP is configured, and then right-click on SQLName and click on **Bring online** cluster.

  ![Windows cluster core resources](./images/windows-fcm-bringonline.png "Windows cluster core resources")

20. The cluster should come online as shown in the following image. Since the cluster is a multi-subnet cluster we can able to see only one network online.

  ![Windows cluster core resources status](./images/windows-fcm-clusteronlinestatus.png "Windows cluster core resources status")

  With the above step, you have successfully set up the two node Windows Server Failover Cluster. You may now **proceed to the next lab**.


## Acknowledgements
* **Author** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering
* **Contributors** -  Devinder Pal Singh, Senior Cloud Engineer, NA Cloud Engineering
* **Last Updated By/Date** - Ramesh Babu Donti, Principal Cloud Architect, NA Cloud Engineering, June 2022
