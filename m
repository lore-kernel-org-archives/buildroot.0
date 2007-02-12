From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:53 -0800
Subject: [Buildroot] [buildroot 0000773]: ipsec-tools fails when cross
	compiling at strip stage
Message-ID: <9b7104638e7d5ab61c75a700eafa7475@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=773 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   773
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-06-2006 07:16 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    ipsec-tools fails when cross compiling at strip
stage
Description: 
The ipsec-tools package is using the host strip instead of the
one built by the buildroot toolchain. This causes the compile to
fail if the target architecture is not the same as the host's
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 08-28-06 06:47  
---------------------------------------------------------------------- 
Fixed in r16001. Thanks for pointing this out. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-06-06 07:16  bjdooks        New Issue                                    
03-06-06 07:16  bjdooks        Status                   new => assigned     
03-06-06 07:16  bjdooks        Assigned To               => uClibc          
03-06-06 07:16  bjdooks        File Added: ipsec-tools-strip-fix.patch          
         
08-28-06 06:47  bernhardf      Status                   assigned => closed  
08-28-06 06:47  bernhardf      Note Added: 0001595                          
08-28-06 06:47  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
