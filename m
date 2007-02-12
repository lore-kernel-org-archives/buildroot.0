From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:21 -0800
Subject: [Buildroot] [buildroot 0000308]: can't login after installaing
	buildroot on compact flash
Message-ID: <c13d90b615441b8f602144dc8c8c3a75@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=308 
====================================================================== 
Reported By:                pavan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   308
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-22-2005 19:54 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    can't login after installaing buildroot on compact
flash
Description: 
i want to setup buildroot on compact flash card of size 128MB.
My native machine where i have mounted compact flash card is running
mandrake 9.1 and has x86 architecture.

To setup buildroot i have done following steps:
1)Downlaod and uncompress buildroot to /tmp in my native machine.
2)run following commands:
#make menuconfig
#make
#make install

3)This created a buildroot hierarchy.under build_i386/root was my root
file system.

4)I copied the entire root file system to my partition of flash card.And
then tried to boot from flash card.

It boots from flash card and i get the login prompt.
but when i can't log in with root user.What is the default root password.

My aim is to get minimal linux running from flash card with apache and
php.
Does buildroot provide networking support?
If i want to setup a firewall on buildroot then is it possible?



pavan.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:38  
---------------------------------------------------------------------- 
this is a procedural problem, and not specific to buildroot 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-22-05 19:54  pavan          New Issue                                    
01-20-06 12:38  prpplague      Note Added: 0000963                          
01-20-06 12:38  prpplague      Status                   assigned => closed  
01-20-06 12:38  prpplague      Resolution               open => no change
required
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
