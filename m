From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:25 -0800
Subject: [Buildroot] [buildroot 0000859]: rsync sources not found
Message-ID: <53a8e1dba92314d06cec1aed58de3fd0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=859 
====================================================================== 
Reported By:                crito
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   859
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-28-2006 07:44 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    rsync sources not found
Description: 
the buildroot snapshot from 2006/04/28 cannot find the rsync sources
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 13:01  
---------------------------------------------------------------------- 
Thanks. I instead bumped the rsync package to version to 2.6.8 which also
fixes the issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-28-06 07:44  crito          New Issue                                    
04-28-06 07:44  crito          Status                   new => assigned     
04-28-06 07:44  crito          Assigned To               => uClibc          
04-28-06 07:44  crito          File Added: buildroot-20060428-rsync.mk.patch    
               
04-28-06 07:50  crito          Issue Monitored: crito                       
04-28-06 13:01  jacmet         Status                   assigned => closed  
04-28-06 13:01  jacmet         Note Added: 0001337                          
04-28-06 13:01  jacmet         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
