From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Jan 2008 20:26:23 -0800
Subject: [Buildroot] [buildroot 0001949]: buildroot toolchain for i386,
	configured with uClibc 0.9.29 or later,
	cannot configure uClibc 0.9.29 or later
Message-ID: <cff0b453bffd364eabd61ca421cda8ce@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1949 
====================================================================== 
Reported By:                zugvogel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1949
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-20-2008 20:26 PST
Last Modified:              01-20-2008 20:26 PST
====================================================================== 
Summary:                    buildroot toolchain for i386, configured with uClibc
0.9.29 or later, cannot configure uClibc 0.9.29 or later
Description: 
The test case was based on the 20080120 snapshot of buildroot, configured
to make a development system. Underlying uClibc was 0.9.29. Settings were
changed from their defaults only when necessary to make add-ons (like
coreutils) compile.

When testing resulting file system as a root jail, make menuconfig would
segfault while trying to compile the ncurses dialog system. It will
segfault again when following up with a "make clean". It will fail
(without segfault) when running make oldconfig against the config file
used to make the buildroot system in the first place.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-20-08 20:26  zugvogel       New Issue                                    
01-20-08 20:26  zugvogel       Status                   new => assigned     
01-20-08 20:26  zugvogel       Assigned To               => buildroot       
======================================================================
