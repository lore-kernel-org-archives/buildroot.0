From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 06:19:22 -0800
Subject: [Buildroot] [buildroot 0001613]: mtd-utils external toolchain fix;
	lzo dependency fix
Message-ID: <f68ed0c3d669fb3db22981d66aa4af89@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1613 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1613
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 06:19 PST
Last Modified:              11-27-2007 06:19 PST
====================================================================== 
Summary:                    mtd-utils external toolchain fix; lzo dependency fix
Description: 
mtd-utils has a few problems:
1. $(TARGET_LDFLAGS) missing from make command, which makes it impossible
to build in an external toolchain configuration.
2. lzo is missing from the dependency chain, while mtd-utils use lzo.

The attached patch fixes the problems.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:19  ikonst         New Issue                                    
11-27-07 06:19  ikonst         Status                   new => assigned     
11-27-07 06:19  ikonst         Assigned To               => buildroot       
11-27-07 06:19  ikonst         File Added: mtd-utils.patch                    
======================================================================
