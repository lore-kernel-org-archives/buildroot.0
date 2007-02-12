From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:20 -0800
Subject: [Buildroot] [buildroot 0000161]: Linux 2.6.10 kernel headers
Message-ID: <c35def649544e89bf4fd099768c97c3b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=161 
====================================================================== 
Reported By:                pgrayson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   161
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2005 18:16 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    Linux 2.6.10 kernel headers
Description: 
This patch obviates the other 2.6.10 kernel header patch which has an error
in it.

Adds support to buildroot for 2.6.10 kernel headers.
====================================================================== 

---------------------------------------------------------------------- 
 pgrayson - 03-15-05 18:34  
---------------------------------------------------------------------- 
The other patch was in bug 0000086.

http://bugs.uclibc.org/view.php?id=86 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:20  
---------------------------------------------------------------------- 
already been added 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-05 18:16  pgrayson       New Issue                                    
03-15-05 18:16  pgrayson       File Added: buildroot-2.6.10-headers.patch       
            
03-15-05 18:34  pgrayson       Note Added: 0000088                          
03-16-05 12:10  andersen       Status                   new => assigned     
03-16-05 12:10  andersen       Assigned To               => uClibc          
03-20-05 18:20  vapier         Status                   assigned => closed  
03-20-05 18:20  vapier         Note Added: 0000104                          
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
