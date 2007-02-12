From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:12 -0800
Subject: [Buildroot] [buildroot 0000475]: Patch to fix typos in buildroot
	MTD config & make files
Message-ID: <d53218cf2ae4caf807769f3e7823eb3c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=475 
====================================================================== 
Reported By:                jdupre
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   475
Category:                   New Features
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-06-2005 15:32 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    Patch to fix typos in buildroot MTD config & make
files
Description: 
Fixes some typos in package/mtd/Config.in & mtd.mk that prevented
nand_eraseall, jffs3dump and nanddump from getting added to the rootfs.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-06-05 15:32  jdupre         New Issue                                    
10-06-05 15:32  jdupre         Status                   new => assigned     
10-06-05 15:32  jdupre         Assigned To               => uClibc          
10-06-05 15:32  jdupre         File Added: mtd-typofixes.patch                  
 
01-23-06 12:49  prpplague      Status                   assigned => resolved
01-23-06 12:49  prpplague      Resolution               open => fixed       
01-23-06 12:49  prpplague      Additional Information Updated                   

03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
