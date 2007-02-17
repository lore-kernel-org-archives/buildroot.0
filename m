From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 17 Feb 2007 14:36:16 -0800
Subject: [Buildroot] [buildroot 0001230]: PATCH: Add pygtk, pygobject,
	and pycairo packages
Message-ID: <b379a437391a24ecea377fbf0f988e42@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1230 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1230
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 14:36 PST
Last Modified:              02-17-2007 14:36 PST
====================================================================== 
Summary:                    PATCH: Add pygtk, pygobject, and pycairo packages
Description: 
The attached patch adds the following new packages to buildroot:

* PyGobject -- Python bindings for the GLIB Gobject library
* PyCairo -- Python bindings for cairo
* PyGTK -- Python bindings for GTK+ 2.x (requires PyGobject and PyCairo)

Note that these new packages all require the python.mk enhancements from
bug 1229 in order to build.

Note also that PyGTK requires the library fixes in bugs 1227 and 1228 in
order to run properly once built.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 14:36  foogod         New Issue                                    
02-17-07 14:36  foogod         Status                   new => assigned     
02-17-07 14:36  foogod         Assigned To               => buildroot       
02-17-07 14:36  foogod         File Added: buildroot.17919.package_pygtk.patch  
                 
======================================================================
