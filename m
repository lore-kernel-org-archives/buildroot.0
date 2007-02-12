From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:26 -0800
Subject: [Buildroot] [buildroot 0000724]: dialog package in 20060217
	snapshot doesn't build
Message-ID: <ae11a0ca92601d45283ce69c376f6d78@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=724 
====================================================================== 
Reported By:                sblaisot
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   724
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2006 03:14 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    dialog package in 20060217 snapshot doesn't build
Description: 
the dialog package, even if selected during configuration, doesn't build
properly and doesn't appear in the target.

make dialog, just after the make command, solves the problem. Looks like
the "dialog" target is not added even if the package was selected.

below is a proposed patch
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 05:38  
---------------------------------------------------------------------- 
Fixed in r17052. Thanks for pointing this out. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-06 03:14  sblaisot       New Issue                                    
02-17-06 03:14  sblaisot       Status                   new => assigned     
02-17-06 03:14  sblaisot       Assigned To               => uClibc          
02-17-06 03:15  sblaisot       Issue Monitored: sblaisot                    
12-22-06 05:38  bernhardf      Status                   assigned => closed  
12-22-06 05:38  bernhardf      Note Added: 0001923                          
12-22-06 05:38  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
