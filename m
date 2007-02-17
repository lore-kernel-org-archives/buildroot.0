From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 17 Feb 2007 14:29:18 -0800
Subject: [Buildroot] [buildroot 0001229]: PATCH: Add $(PYTHON_FOR_BUILD)
Message-ID: <1fa3d0ed032affc95434db4373b7f626@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1229 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1229
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-17-2007 14:29 PST
Last Modified:              02-17-2007 14:29 PST
====================================================================== 
Summary:                    PATCH: Add $(PYTHON_FOR_BUILD)
Description: 
The attached patch adds the ability to build a native version of python
from the same sources and build options as the target version.  This is
needed for cross-compiling many python extensions, as their configure
scripts attempt to run a native python interpreter assuming it will
provide sensible values for building to the target.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-17-07 14:29  foogod         New Issue                                    
02-17-07 14:29  foogod         Status                   new => assigned     
02-17-07 14:29  foogod         Assigned To               => buildroot       
02-17-07 14:29  foogod         File Added:
buildroot.17919.python_for_build.patch                    
======================================================================
