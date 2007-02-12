From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:36 -0800
Subject: [Buildroot] [buildroot 0001188]: samba package build sometimes fails
Message-ID: <76bbc5b9d0550b49d0fab87e19782fa0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1188 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1188
Category:                   Other
Reproducibility:            sometimes
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-31-2007 05:06 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    samba package build sometimes fails
Description: 
because a error in samba makefile the make -j... sometimes fails because
include/proto.h is not generated yet. 

It happens in http://busybox.net/bugs/view.php?id=118#50% with -j3 on my
computer. 

Suggested fix: change $(MAKE) to $(MAKE1) in samba.mk
====================================================================== 

---------------------------------------------------------------------- 
 janlana - 02-02-07 01:13  
---------------------------------------------------------------------- 
it looks that just $(MAKE1) does not solve the problem. Suggest to close
the bug for now. I will submit new issue when I find a fix. 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:15  
---------------------------------------------------------------------- 
Closed upon reporters request. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-31-07 05:06  janlana        New Issue                                    
01-31-07 05:06  janlana        Status                   new => assigned     
01-31-07 05:06  janlana        Assigned To               => uClibc          
02-02-07 01:13  janlana        Note Added: 0002086                          
02-04-07 09:15  bernhardf      Status                   assigned => closed  
02-04-07 09:15  bernhardf      Note Added: 0002109                          
02-04-07 09:15  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
