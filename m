From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 6 Oct 2008 07:13:14 -0700
Subject: [Buildroot] [buildroot 0005274]: Build of package openssl is broken
Message-ID: <6af7b23ca2c80f44dca8599fbffb0c69@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5274 
====================================================================== 
Reported By:                Feynman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5274
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-06-2008 07:13 PDT
Last Modified:              10-06-2008 07:13 PDT
====================================================================== 
Summary:                    Build of package openssl is broken
Description: 
The building of the openssl package fails on i386 and may be also on i686
systems. The OPENSSL_TARGET_ARCH define is set to a no longer supported
architecture. For an i386 system this define must set to
"linux-generic32".

Christian

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-06-08 07:13  Feynman        New Issue                                    
10-06-08 07:13  Feynman        Status                   new => assigned     
10-06-08 07:13  Feynman        Assigned To               => buildroot       
======================================================================
