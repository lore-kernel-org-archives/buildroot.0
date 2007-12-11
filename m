From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 11 Dec 2007 15:11:19 -0800
Subject: [Buildroot] [buildroot 0001699]: [PATCH] Improves Qtopia build.
Message-ID: <30bb2170eec8f7fd5d554251f83cbf18@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1699 
====================================================================== 
Reported By:                Correa
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1699
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-11-2007 15:11 PST
Last Modified:              12-11-2007 15:11 PST
====================================================================== 
Summary:                    [PATCH] Improves Qtopia build.
Description: 
  This patch greatly improves qtopia build, with a single build step
(instead of the build twice in HEAD). Also adds new make menu options:
Allows for static or shared build, lets you decide to compile with
libjpeg or zlib (shared linked with system lib, or the static version
provided with qtopia). It also fixes the build of qtopia based
projects, by adding the toolchain paths to the qmake.conf files.

  The qtopia-4.3.2-add-avr32-arch.patch is more or less the same as
the patch for the other version, except that this one is a single
patch for both the code support and the -qatomic-header-to-header-list
thing.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-11-07 15:11  Correa         New Issue                                    
12-11-07 15:11  Correa         Status                   new => assigned     
12-11-07 15:11  Correa         Assigned To               => buildroot       
12-11-07 15:11  Correa         File Added: qtopia.patch                     
======================================================================
