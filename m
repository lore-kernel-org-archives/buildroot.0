From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 22 Aug 2007 08:12:50 -0700
Subject: [Buildroot] [buildroot 0001469]: Add fuse and ntfs package for
	buildroot
Message-ID: <24fcf939a109753603d3fada340892fa@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1469 
====================================================================== 
Reported By:                alextud
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1469
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-22-2007 08:12 PDT
Last Modified:              08-22-2007 08:12 PDT
====================================================================== 
Summary:                    Add fuse and ntfs package for buildroot
Description: 
Hi,
I made some makefile for fuse and ntfs-3g and I'll be happy if you can add
them to  buildroot package.
Ntfs-3g mount always fail with default busybox mount command, only work
with mount from util-linux package, I think that its related with fuse and
mount from busybox, fix me if I wrong.
Also I disabled in fuse symvers related to version 2.2 because on runtime
fusermount show: unknown '" option. 
I'm just started with buildroot and my files maybe contains some error,
feel free to modify them.

Thanks, Alex.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-22-07 08:12  alextud        New Issue                                    
08-22-07 08:12  alextud        Status                   new => assigned     
08-22-07 08:12  alextud        Assigned To               => buildroot       
08-22-07 08:12  alextud        File Added: fuse&ntfs_mk.tar.gz                  
 
======================================================================
