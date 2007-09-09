From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 9 Sep 2007 08:25:13 -0700
Subject: [Buildroot] [buildroot 0001495]: libgtk1.2 is built before xlibs,
	resulting in "libX11 not found" error
Message-ID: <2d82a9616a161bdca36dfab22b644d24@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1495 
====================================================================== 
Reported By:                johndoe1
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1495
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-09-2007 08:25 PDT
Last Modified:              09-09-2007 08:25 PDT
====================================================================== 
Summary:                    libgtk1.2 is built before xlibs, resulting in
"libX11 not found" error
Description: 
Because the X11 libraries have not been built yet, configuration of
libgtk1.2 gives the following error:
...
checking for XOpenDisplay in -lX11... no
configure: error: *** libX11 not found. Check 'config.log' for more
details.

I had to temporarily turn off libgtk12 in menuconfig to allow X11 to build
first.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-09-07 08:25  johndoe1       New Issue                                    
09-09-07 08:25  johndoe1       Status                   new => assigned     
09-09-07 08:25  johndoe1       Assigned To               => buildroot       
======================================================================
