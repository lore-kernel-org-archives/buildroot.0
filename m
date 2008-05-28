From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 28 May 2008 06:27:09 -0700
Subject: [Buildroot] [buildroot 0003464]: Building Generic development
	system fails (Second of two bugs)
Message-ID: <3b1daa15f773880463543fb88e20fc0f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3464 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3464
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-28-2008 06:27 PDT
Last Modified:              05-28-2008 06:27 PDT
====================================================================== 
Summary:                    Building Generic development system fails (Second of
two bugs)
Description: 
1. Build of "Generic development system" requires a build of pciutils.
2. pciutils is not likely to compile if the architecture of the build
system is   different from the architecture of the target system as lots
of host applications are run during pciutils configuration. When compiling
for a mipsel target using a i686 host pciutils tries to compile intel
spesific code.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-28-08 06:27  KHAksnes       New Issue                                    
05-28-08 06:27  KHAksnes       Status                   new => assigned     
05-28-08 06:27  KHAksnes       Assigned To               => buildroot       
======================================================================
