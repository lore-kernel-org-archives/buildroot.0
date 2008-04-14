From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 14 Apr 2008 04:35:10 -0700
Subject: [Buildroot] [buildroot 0002914]: X11R7 fails to build with a fork
	bomb.
Message-ID: <54ac3178ff4be1f35d8105252eff960d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2914 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2914
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-14-2008 04:35 PDT
Last Modified:              04-14-2008 04:35 PDT
====================================================================== 
Summary:                    X11R7 fails to build with a fork bomb.
Description: 
X11R7 fails to build in a nasty way. 
The package check is missing (As far as I understand this is
check.sourceforge.net) When ./configure in libxcb-1.1 tries to test for
this it starts a fork bomb making my development machine (a fedora 8
laptop) grind to a halt.

I am using a current buildroot. (svn at 21732)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-14-08 04:35  KHAksnes       New Issue                                    
04-14-08 04:35  KHAksnes       Status                   new => assigned     
04-14-08 04:35  KHAksnes       Assigned To               => buildroot       
======================================================================
