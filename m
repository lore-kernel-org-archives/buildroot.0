From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:29 -0800
Subject: [Buildroot] [buildroot 0000484]: target/ext2/ext2root.mk ignores
	reserved-block count of 0 (RESBLKS=0)
Message-ID: <15430cffedbe64b5061e8c2ec960c83f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=484 
====================================================================== 
Reported By:                timw
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   484
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-12-2005 08:32 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    target/ext2/ext2root.mk ignores reserved-block count
of 0 (RESBLKS=0)
Description: 
In target/ext2/ext2root.mk (in HEAD), BR2_TARGET_ROOTFS_EXT2_RESBLKS is
ignored if it is 0. It should be used if it is 0 (since 0 means something
here--"do not reserve any blocks".
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:35  
---------------------------------------------------------------------- 
Fixed in 17050. Better late than never.. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-12-05 08:32  timw           New Issue                                    
10-12-05 08:32  timw           Status                   new => assigned     
10-12-05 08:32  timw           Assigned To               => uClibc          
10-12-05 08:32  timw           File Added: ext2root.patch                    
12-22-06 04:35  bernhardf      Status                   assigned => closed  
12-22-06 04:35  bernhardf      Note Added: 0001916                          
12-22-06 04:35  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
