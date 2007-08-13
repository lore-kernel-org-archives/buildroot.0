From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Aug 2007 11:04:42 -0700
Subject: [Buildroot] [buildroot 0001463]: build for i386/Geode fails
Message-ID: <ecff0fe03e02cb117aed931d51c1dbbb@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1463 
====================================================================== 
Reported By:                Bob Keyes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1463
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-13-2007 11:04 PDT
Last Modified:              08-13-2007 11:04 PDT
====================================================================== 
Summary:                    build for i386/Geode fails
Description: 
Buildroot tries to build Linx kernel, but the architecture isn't set, so it
can't find the Makefile.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 11:04  Bob Keyes      New Issue                                    
08-13-07 11:04  Bob Keyes      Status                   new => assigned     
08-13-07 11:04  Bob Keyes      Assigned To               => buildroot       
======================================================================
