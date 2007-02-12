From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:18 -0800
Subject: [Buildroot] [buildroot 0000654]: Changing the thread model selected
	does not force a rebuild on SH4
Message-ID: <35e8ff742be7b53f33d8be2378a9093d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=654 
====================================================================== 
Reported By:                zx80user
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   654
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-21-2006 13:38 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Changing the thread model selected does not force a
rebuild on SH4
Description: 
Shifting between differnt thread library models does not cause a rebuild on
SH4
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 01-22-06 08:20  
---------------------------------------------------------------------- 
this is true of just about every config option in uClibc

i dont really see it being worth the effort at this time to track how
every config option affects files

run `make clean` after tweaking your config 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-21-06 13:38  zx80user       New Issue                                    
01-21-06 13:38  zx80user       Status                   new => assigned     
01-21-06 13:38  zx80user       Assigned To               => uClibc          
01-22-06 08:20  vapier         Note Added: 0000973                          
01-22-06 08:20  vapier         Status                   assigned => closed  
01-22-06 08:20  vapier         Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
