From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 01:48:45 -0700
Subject: [Buildroot] [buildroot 0001390]: syslinux broken link
Message-ID: <581e89c5a2ad2545554f8d35420cdcb3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             06-12-2007 08:02 PDT
Last Modified:              09-24-2007 01:48 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 01:48  
---------------------------------------------------------------------- 
This was updated quite some time ago. Thanks for the report! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-12-07 08:02  eneko          New Issue                                    
06-12-07 08:02  eneko          Status                   new => assigned     
06-12-07 08:02  eneko          Assigned To               => buildroot       
09-24-07 01:48  bernhardf      Status                   assigned => closed  
09-24-07 01:48  bernhardf      Note Added: 0002782                          
======================================================================
