From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 17 Aug 2008 03:55:11 -0700
Subject: [Buildroot] [buildroot 0004614]: Unable to build varius xorg X11
	drivers.
Message-ID: <261208e429d676420ddeeab665e4526f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4614 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4614
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-17-2008 03:55 PDT
Last Modified:              08-17-2008 03:55 PDT
====================================================================== 
Summary:                    Unable to build varius xorg X11 drivers.
Description: 
One cannot build the x11 {joystick,mouse}-input-driver, amongst others. As
it seems they expect pixman.h to be located in /usr/include/ and not
/usr/include/pixman-1/ after all.  As almost all input drivers I have
tried expects this, I would suggest to change the pixman package to place
a copy of the files there.

I have submitted a patch to that effect.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-17-08 03:55  antialize      New Issue                                    
08-17-08 03:55  antialize      Status                   new => assigned     
08-17-08 03:55  antialize      Assigned To               => buildroot       
08-17-08 03:55  antialize      File Added: pixman-copy.patch                    
======================================================================
