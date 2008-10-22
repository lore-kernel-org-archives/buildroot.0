From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 22 Oct 2008 15:38:18 -0700
Subject: [Buildroot] [buildroot 0005674]: Outdated syslinux links.
Message-ID: <69c76a68f337e43c488979ddd352b26d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5674 
====================================================================== 
Reported By:                ksnieck
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5674
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2008 15:38 PDT
Last Modified:              10-22-2008 15:38 PDT
====================================================================== 
Summary:                    Outdated syslinux links.
Description: 
When configuring for pxelinux or syslinux images, build fails because
syslinux has since been updated and the version number buildroot looks for
is no longer at kernel.org.
Changing the version number and commenting out the bit about the patch, in
the buildroot/target/x86/syslinux/syslinux.mk file causes the build to
complete succesfully, but I don't know what the patch was doing, so it
might not do what it was intended to anymore.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-08 15:38  ksnieck        New Issue                                    
10-22-08 15:38  ksnieck        Status                   new => assigned     
10-22-08 15:38  ksnieck        Assigned To               => buildroot       
======================================================================
