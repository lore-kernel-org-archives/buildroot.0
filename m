From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:44 -0800
Subject: [Buildroot] [buildroot 0000441]: sed/sed.exe and linking on cygwin
Message-ID: <c5eee08ce958817839a792a65214d2a6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=441 
====================================================================== 
Reported By:                ee_doright
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   441
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-21-2005 20:23 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    sed/sed.exe and linking on cygwin
Description: 
When the build fails on cygwin, running make again always results in a
failure, due to the line(s) in {BUILDROOT}/package/sed/sed.mk

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-21-05 20:23  ee_doright     New Issue                                    
09-21-05 20:23  ee_doright     Status                   new => assigned     
09-21-05 20:23  ee_doright     Assigned To               => uClibc          
01-24-06 13:35  prpplague      Status                   assigned => resolved
01-24-06 13:35  prpplague      Resolution               open => fixed       
01-24-06 13:35  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
