From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 13:06:31 -0700
Subject: [Buildroot] [buildroot 0001531]: Linux kernel fails to build for
	mipsel target
Message-ID: <79e0e7e8de58a1d6651702dfd22d06cc@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1531 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1531
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-16-2007 13:06 PDT
Last Modified:              10-16-2007 13:06 PDT
====================================================================== 
Summary:                    Linux kernel fails to build for mipsel target
Description: 
Kernel files seems to be compiled with the wrong endianness. Build fails
early in the kernel build for the current SVN version of BusyBox
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 13:06  KHAksnes       New Issue                                    
10-16-07 13:06  KHAksnes       Status                   new => assigned     
10-16-07 13:06  KHAksnes       Assigned To               => buildroot       
10-16-07 13:06  KHAksnes       File Added: mipsel.config                    
======================================================================
