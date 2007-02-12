From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:14 -0800
Subject: [Buildroot] [buildroot 0000110]: wrong depends on GDB Version
Message-ID: <4a4637f940785ce97152b890e5cfe26a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=110 
====================================================================== 
Reported By:                acmay
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   110
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2005 17:09 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    wrong depends on GDB Version
Description: 
The gdb version depends on BR2_HOST_GDB, but it should be
BR2_PACKAGE_GDB_CLIENT.

And it was probably my fault too.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:33  
---------------------------------------------------------------------- 
fixed, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-05 17:09  acmay          New Issue                                    
02-17-05 17:09  acmay          File Added: br-gdb.patch                     
03-16-05 12:13  andersen       Status                   new => assigned     
03-16-05 12:13  andersen       Assigned To               => uClibc          
03-20-05 18:33  vapier         Note Added: 0000106                          
03-20-05 18:55  vapier         Status                   assigned => closed  
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
