From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Mar 2008 05:20:49 -0700
Subject: [Buildroot] [buildroot 0002624]: Error in default inittab
Message-ID: <16fd14c6fb087210771c4b0c395b7710@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2624 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2624
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-17-2008 05:20 PDT
Last Modified:              03-17-2008 05:20 PDT
====================================================================== 
Summary:                    Error in default inittab
Description: 
When starting Busybox syslogd from initab using respawn please use the -n
option.
If syslogd is started as daemon it returns the pre-fork pid. The result is
a kind of fork bomb with lots of syslogd processes eating up resources.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-17-08 05:20  KHAksnes       New Issue                                    
03-17-08 05:20  KHAksnes       Status                   new => assigned     
03-17-08 05:20  KHAksnes       Assigned To               => buildroot       
======================================================================
