From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:24 -0800
Subject: [Buildroot] [buildroot 0000855]: elf2flt cross-compilation error on
	Debian platform
Message-ID: <c5db6f415f169289ef5c5d0ba4787a2c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=855 
====================================================================== 
Reported By:                hootsmon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   855
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-27-2006 22:09 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    elf2flt cross-compilation error on Debian platform
Description: 
The problem occurs when compiling buildroot toolchain, for NIOS II on a
Debian platform.  The elf2flt utility fails to compile, due to missing
include-files.

The solution is to add 1-line to elf2flt.mk, as per supplied pathfile
(attached).

More info here....
http://www.niosforum.com/pages/forum.php?cat_id=5



====================================================================== 

---------------------------------------------------------------------- 
 hootsmon - 04-27-06 22:44  
---------------------------------------------------------------------- 
Here is the niosforum thread where this error got resolved...
http://forum.niosforum.com/forum/index.php?showtopic=3573# 

---------------------------------------------------------------------- 
 vapier - 04-28-06 21:08  
---------------------------------------------------------------------- 
thanks, added to svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-27-06 22:09  hootsmon       New Issue                                    
04-27-06 22:09  hootsmon       Status                   new => assigned     
04-27-06 22:09  hootsmon       Assigned To               => uClibc          
04-27-06 22:09  hootsmon       File Added: elf2flt.diff                     
04-27-06 22:44  hootsmon       Note Added: 0001331                          
04-28-06 21:08  vapier         Note Added: 0001338                          
04-28-06 21:08  vapier         Status                   assigned => closed  
04-28-06 21:08  vapier         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
