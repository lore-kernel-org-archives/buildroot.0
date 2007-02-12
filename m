From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:54 -0800
Subject: [Buildroot] [buildroot 0000725]: bad dialog version (and thus URL)
	in dialog package in 20060217 snapshot
Message-ID: <5bac28cf6c3200e45aa5fe4f07b74b1f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=725 
====================================================================== 
Reported By:                sblaisot
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   725
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2006 05:13 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    bad dialog version (and thus URL) in dialog package
in 20060217 snapshot
Description: 
in 20060217 snapshot, the version of dialog downloaded by
packages/dialog/dialog.mk doesn't exist anymore on the ftp server of
debian. It is also pretty old.

below is a proposed patch with a more recent version that seems to work :
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:12  
---------------------------------------------------------------------- 
This was fixed in r17052. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-06 05:13  sblaisot       New Issue                                    
02-17-06 05:13  sblaisot       Status                   new => assigned     
02-17-06 05:13  sblaisot       Assigned To               => uClibc          
02-17-06 05:14  sblaisot       Issue Monitored: sblaisot                    
01-21-07 09:12  bernhardf      Status                   assigned => closed  
01-21-07 09:12  bernhardf      Note Added: 0002021                          
01-21-07 09:12  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
