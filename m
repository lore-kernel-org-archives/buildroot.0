From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 10:26:14 -0700
Subject: [Buildroot] [buildroot 0000879]: Fix gettext build
Message-ID: <9398a030deae70be66eaf59bf4a5a262@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=879 
====================================================================== 
Reported By:                mastag
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   879
Category:                   New Features
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-23-2006 19:30 PDT
Last Modified:              03-20-2007 10:26 PDT
====================================================================== 
Summary:                    Fix gettext build
Description: 
a patch against current buildroot tree to make gettext compile without the
progname error.
got the fix from the lists.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 05-24-06 07:58  
---------------------------------------------------------------------- 
fixed as of revision 15161 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 10:26  
---------------------------------------------------------------------- 
This was apparently fixed some time ago. Closing 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-06 19:30  mastag         New Issue                                    
05-23-06 19:30  mastag         Status                   new => assigned     
05-23-06 19:30  mastag         Assigned To               => uClibc          
05-23-06 19:30  mastag         File Added: buildroot_gettext-prognamefix.patch  
                 
05-24-06 07:58  prpplague      Note Added: 0001379                          
05-24-06 07:58  prpplague      Status                   assigned => closed  
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
03-20-07 10:26  bernhardf      Status                   assigned => closed  
03-20-07 10:26  bernhardf      Note Added: 0002251                          
======================================================================
