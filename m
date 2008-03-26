From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 04:30:24 -0700
Subject: [Buildroot] [buildroot 0002694]: busybox generates illegal
	instruction error on ARM platform
Message-ID: <a3c4e693821c3e02b44d06a2d634a257@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2694 
====================================================================== 
Reported By:                ychuang
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2694
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-26-2008 04:30 PDT
Last Modified:              03-26-2008 04:30 PDT
====================================================================== 
Summary:                    busybox generates illegal instruction error on ARM
platform
Description: 
After applying current new patchs (using svn) for buildroot, busybox
commands: insmod, rmmod, and ping generate illegal instruction error after
rebuilding the whole toolchain and recompiling busybox 1.9 (or 1.10).

busybox 1.9.0 was working with old toolchain back on 2007/11/02.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-26-08 04:30  ychuang        New Issue                                    
03-26-08 04:30  ychuang        Status                   new => assigned     
03-26-08 04:30  ychuang        Assigned To               => buildroot       
03-26-08 04:30  ychuang        File Added: .config                          
======================================================================
