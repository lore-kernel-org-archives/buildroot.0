From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 28 Oct 2007 11:53:28 -0700
Subject: [Buildroot] [buildroot 0001560]: libmad should be libtoolized
Message-ID: <3711b5580f9241976d620c73d9211d0a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1560 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1560
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2007 11:53 PDT
Last Modified:              10-28-2007 11:53 PDT
====================================================================== 
Summary:                    libmad should be libtoolized
Description: 
Current version of libmad comes with ltmain.sh which is incompatible with
modern versions of libtool, causing shared objects to be built without the
.so extension.

This patch invokes libtoolize (which is a utility from the libtool package
and comes along with libtool itself) to create an appropriate ltmain.sh.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-07 11:53  ikonst         New Issue                                    
10-28-07 11:53  ikonst         Status                   new => assigned     
10-28-07 11:53  ikonst         Assigned To               => buildroot       
10-28-07 11:53  ikonst         File Added: buildroot-libmad-libtoolize.patch    
               
======================================================================
