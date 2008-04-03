From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 3 Apr 2008 13:23:03 -0700
Subject: [Buildroot] [buildroot 0002794]: build fails on ARM arch with
	external toolchain (gcc-4.2.1-glibc-2.6.1 EABI)
Message-ID: <38e923a2910ea739bf3ff871e2b2c019@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2794 
====================================================================== 
Reported By:                davidg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2794
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-03-2008 13:23 PDT
Last Modified:              04-03-2008 13:23 PDT
====================================================================== 
Summary:                    build fails on ARM arch with external toolchain
(gcc-4.2.1-glibc-2.6.1 EABI)
Description: 
Received following error trying to build with external toolchain:

make: *** No rule to make target `/.config', needed by
`/home/david/at91/buildroot/project_build_arm/at91sam9260dfc/root/boot/uclibc.config'.
 Stop.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-03-08 13:23  davidg         New Issue                                    
04-03-08 13:23  davidg         Status                   new => assigned     
04-03-08 13:23  davidg         Assigned To               => buildroot       
======================================================================
