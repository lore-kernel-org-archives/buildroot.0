From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 8 Aug 2008 01:33:41 -0700
Subject: [Buildroot] [buildroot 0004524]: Missing \ in Makefile.autotools.in
	makes fontconfig fail to compile
Message-ID: <c2a65c19689a51857e3f4f9d0f633542@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4524 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4524
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2008 01:31 PDT
Last Modified:              08-08-2008 01:33 PDT
====================================================================== 
Summary:                    Missing \ in Makefile.autotools.in makes fontconfig
fail to compile
Description: 
There is a missing \ in Makefile.autotools.in that affects fontconfig, and
possible alot of other not to configure.

I have attached a patch that fixes the issue, and also cleans up the
fontconfig.mk

(Rev 23070)
====================================================================== 

---------------------------------------------------------------------- 
 antialize - 08-08-08 01:33  
---------------------------------------------------------------------- 
This is a dup of,
0004474 and 0004454 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-08 01:31  antialize      New Issue                                    
08-08-08 01:31  antialize      Status                   new => assigned     
08-08-08 01:31  antialize      Assigned To               => buildroot       
08-08-08 01:31  antialize      File Added: fix.patch                        
08-08-08 01:33  antialize      Note Added: 0010334                          
======================================================================
