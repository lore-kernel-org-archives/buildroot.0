From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:44 -0800
Subject: [Buildroot] [buildroot 0001191]: fix gcc,
	grub and lzma pckages spurious rebuild
Message-ID: <fda6f856d2ead942d1d79f5557a56bbd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1191 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1191
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-01-2007 03:15 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    fix gcc, grub and lzma pckages spurious rebuild
Description: 
see attached patches
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:39  
---------------------------------------------------------------------- 
Fixed in svn r17763. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-01-07 03:15  janlana        New Issue                                    
02-01-07 03:15  janlana        Status                   new => assigned     
02-01-07 03:15  janlana        Assigned To               => uClibc          
02-01-07 03:15  janlana        File Added: package_lzma.patch                   

02-01-07 03:16  janlana        File Added: toolchain_gcc.patch                  
 
02-01-07 03:16  janlana        File Added: target_x86_grub.patch                
   
02-04-07 08:39  bernhardf      Status                   assigned => closed  
02-04-07 08:39  bernhardf      Note Added: 0002097                          
02-04-07 08:39  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
