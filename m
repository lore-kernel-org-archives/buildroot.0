From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:08 -0800
Subject: [Buildroot] [buildroot 0000963]: e2fsprogs old patch file
Message-ID: <06386ab57598e243480b1484dda6cc6a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=963 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   963
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-19-2006 12:24 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    e2fsprogs old patch file
Description: 
we're at e2fsprogs-1.38 but there's  e2fsprogs-1.37-2.patch!

the patch fails.

disabling the patch and it compiles, but no testing has been done to see
if it works.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:52  
---------------------------------------------------------------------- 
no such patch is in the repo 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-19-06 12:24  bowerymarc     New Issue                                    
07-19-06 12:24  bowerymarc     Status                   new => assigned     
07-19-06 12:24  bowerymarc     Assigned To               => uClibc          
07-19-06 16:52  vapier         Note Added: 0001533                          
07-19-06 16:52  vapier         Status                   assigned => closed  
07-19-06 16:52  vapier         Resolution               open => unable to
reproduce
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
