From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 7 May 2008 11:01:08 -0700
Subject: [Buildroot] [buildroot 0003274]: Package Python broken
Message-ID: <6fd46b8f7e4f7ee6e5532e88d5baab30@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3274 
====================================================================== 
Reported By:                roeme
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3274
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-07-2008 11:01 PDT
Last Modified:              05-07-2008 11:01 PDT
====================================================================== 
Summary:                    Package Python broken
Description: 
When trying to include the python package, the build process fails with the
following error:

make[1]: Leaving directory
`/home/roeme/minim/buildroot/buildroot/build_i586/Python-2.4.2'
/bin/sh: line 8: -/usr/bin/make: No such file or directory
make: ***
[/home/roeme/minim/buildroot/buildroot/build_i586/Python-2.4.2/.hostpython]
Error 127

Enabling "Development Files on target" or removing modules marked as
"unusual" (curses/unicodedata) does not help as well as reducing the
number of jobs to run simultaneously.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-07-08 11:01  roeme          New Issue                                    
05-07-08 11:01  roeme          Status                   new => assigned     
05-07-08 11:01  roeme          Assigned To               => buildroot       
======================================================================
