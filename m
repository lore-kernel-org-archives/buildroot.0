From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:14 -0800
Subject: [Buildroot] [buildroot 0000515]: generic skeleton tweaks
Message-ID: <49d470e3c448d605ec38e8f00e507a24@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=515 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   515
Category:                   Other
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:39 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    generic skeleton tweaks
Description: 
This patch does three small things:

 * the df alias doesn't work with busybox - removed it
 * call /etc/init.d/rcK on shutdown - be consistant with rcS
 * fix S20urandom to work on readonly filesystems when /etc/random-seed is
a symlink
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:39  akvadrako      New Issue                                    
10-28-05 09:39  akvadrako      Status                   new => assigned     
10-28-05 09:39  akvadrako      Assigned To               => uClibc          
10-28-05 09:39  akvadrako      File Added:
br-generic-target-startup-changes.patch                    
01-23-06 08:55  prpplague      Status                   assigned => closed  
01-23-06 08:55  prpplague      Resolution               open => won't fix   
01-23-06 08:55  prpplague      Additional Information Updated                   

02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
