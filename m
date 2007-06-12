From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 12 Jun 2007 08:02:29 -0700
Subject: [Buildroot] [buildroot 0001390]: syslinux broken link
Message-ID: <7b21935a508c07bc82c5ee5cbf19d008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1390 
====================================================================== 
Reported By:                eneko
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1390
Category:                   Other
Reproducibility:            have not tried
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-12-2007 08:02 PDT
Last Modified:              06-12-2007 08:02 PDT
====================================================================== 
Summary:                    syslinux broken link
Description: 
Trying to make with syslinux selected as bootloader for target devices and
fails when trying to download syslinux. The problem is that it search
syslinux at URL:

http://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-3.31.tar.bz2

but it is at:

http://www.kernel.org/pub/linux/utils/boot/syslinux/Old/syslinux-3.31.tar.bz2

Nice project!!

Eneko
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-12-07 08:02  eneko          New Issue                                    
06-12-07 08:02  eneko          Status                   new => assigned     
06-12-07 08:02  eneko          Assigned To               => buildroot       
======================================================================
