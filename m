From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:29 -0800
Subject: [Buildroot] [buildroot 0001203]: grub patch grub_0.97-20.diff.gz
	doesn't exists
Message-ID: <5a97b4341ecbe9b63385c4010d2bc7e5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1203 
====================================================================== 
Reported By:                rgenoud
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1203
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-07-2007 05:39 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    grub patch grub_0.97-20.diff.gz doesn't exists
Description: 
the file http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-20.diff.gz
doesn't exists any more.
=> wget fails.
we just have to change from grub_0.97-20.diff.gz to grub_0.97-22.diff.gz

patch included
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-07-07 06:28  
---------------------------------------------------------------------- 
This was already fixed several hours ago. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-07-07 05:39  rgenoud        New Issue                                    
02-07-07 05:39  rgenoud        Status                   new => assigned     
02-07-07 05:39  rgenoud        Assigned To               => uClibc          
02-07-07 05:39  rgenoud        File Added: grub.mk.patch                    
02-07-07 06:28  bernhardf      Status                   assigned => closed  
02-07-07 06:28  bernhardf      Note Added: 0002133                          
02-07-07 06:28  bernhardf      Resolution               open => no change
required
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
