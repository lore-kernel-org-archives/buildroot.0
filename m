From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:05 -0800
Subject: [Buildroot] [buildroot 0000662]: fix unziping problem in MTD
	compilation
Message-ID: <9065b9f46810627b76be87ae53798e62@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=662 
====================================================================== 
Reported By:                korzakow
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   662
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-27-2006 01:22 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    fix unziping problem in MTD compilation
Description: 
Fix mtd.mk unziping problem due to the difference between daily snapshot
archive format and stable release format.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-27-06 01:22  korzakow       New Issue                                    
01-27-06 01:22  korzakow       Status                   new => assigned     
01-27-06 01:22  korzakow       Assigned To               => uClibc          
01-27-06 01:22  korzakow       File Added: mtd.patch                        
01-27-06 04:59  prpplague      Status                   assigned => resolved
01-27-06 04:59  prpplague      Resolution               open => fixed       
01-27-06 04:59  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
