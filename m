From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 23 Apr 2007 17:18:39 -0700
Subject: [Buildroot] [buildroot 0001323]: zlib problems
Message-ID: <b1a3348ae1eb325eacd70203a976cfea@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1323 
====================================================================== 
Reported By:                asquared
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1323
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-23-2007 17:18 PDT
Last Modified:              04-23-2007 17:18 PDT
====================================================================== 
Summary:                    zlib problems
Description: 
Many packages are failing to compile because they are unable to find the
zlib headers. This appears to happen regardless of whether or not
installation of zlib headers is enabled in 'make menuconfig'. Zlib headers
have been installed on the development system, and this does not solve the
problem. This has been reproduced with both default and customized
configurations of buildroot.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-23-07 17:18  asquared       New Issue                                    
04-23-07 17:18  asquared       Status                   new => assigned     
04-23-07 17:18  asquared       Assigned To               => buildroot       
======================================================================
