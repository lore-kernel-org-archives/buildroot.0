From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 23 Apr 2007 17:20:07 -0700
Subject: [Buildroot] [buildroot 0001323]: zlib problems
Message-ID: <ef7b87d2092d3f955fc48e250da46b92@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              04-23-2007 17:20 PDT
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

---------------------------------------------------------------------- 
 asquared - 04-23-07 17:20  
---------------------------------------------------------------------- 
It appears that I have filed this bug under the architecture-specific
category, so I probably should add that this occurs when targeting x86. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-23-07 17:18  asquared       New Issue                                    
04-23-07 17:18  asquared       Status                   new => assigned     
04-23-07 17:18  asquared       Assigned To               => buildroot       
04-23-07 17:20  asquared       Note Added: 0002328                          
======================================================================
