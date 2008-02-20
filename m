From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 20 Feb 2008 12:19:11 -0800
Subject: [Buildroot] [buildroot 0002284]: [PATCH] elf2flt missing two
	relocations for the -a option (absolute mode)
Message-ID: <627b269fa22c0f8a1c2f58ef1aa9107b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2284 
====================================================================== 
Reported By:                stigpo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2284
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-20-2008 12:19 PST
Last Modified:              02-20-2008 12:19 PST
====================================================================== 
Summary:                    [PATCH] elf2flt missing two relocations for the -a
option (absolute mode)
Description: 
elf2flt -a is missing two relocations:
R_ARM_PLT32
R_ARM_PC24

The patch add these and will allow generic arm to use the -a flag
(absolute mode).

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-20-08 12:19  stigpo         New Issue                                    
02-20-08 12:19  stigpo         Status                   new => assigned     
02-20-08 12:19  stigpo         Assigned To               => buildroot       
02-20-08 12:19  stigpo         File Added:
elf2flt-arm-missing-relocations-for-absolute-mode.patch                    
======================================================================
