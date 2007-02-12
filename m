From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:39 -0800
Subject: [Buildroot] [buildroot 0000502]: device-mapper: new version
Message-ID: <bc2fc0788d9f6b855b4f50b007d0a0c8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=502 
====================================================================== 
Reported By:                deac
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   502
Category:                   New Features
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-24-2005 09:21 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    device-mapper: new version
Description: 
device-manager has a new version: 1.01.05
it must be installed to compile lvm2-1.01*.
(see also next bug of me)

the dm.mk must be patched.
in this patch, theres also a "rm -f $@" instead "rm $@"
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-24-05 09:21  deac           New Issue                                    
10-24-05 09:21  deac           Status                   new => assigned     
10-24-05 09:21  deac           Assigned To               => uClibc          
10-24-05 09:21  deac           File Added: dm.mk.patch                      
01-24-06 13:09  prpplague      Status                   assigned => resolved
01-24-06 13:09  prpplague      Resolution               open => fixed       
01-24-06 13:09  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
