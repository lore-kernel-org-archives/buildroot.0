From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 17 Aug 2008 01:47:43 -0700
Subject: [Buildroot] [buildroot 0004604]: MPlayer cannot compile on i686
	without -fomit-frame-pointer
Message-ID: <b3b97816a03a63a0639e3ea81956416b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4604 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4604
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-17-2008 01:47 PDT
Last Modified:              08-17-2008 01:47 PDT
====================================================================== 
Summary:                    MPlayer cannot compile on i686 without
-fomit-frame-pointer
Description: 
Some parts of the mplayer assembly code cannot be compiled without on i686
without -fomit-frame-pointer do to a lag of registers.

I have submitted a patch that will allow one to optionally enable this
flag for mplayer only 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-17-08 01:47  antialize      New Issue                                    
08-17-08 01:47  antialize      Status                   new => assigned     
08-17-08 01:47  antialize      Assigned To               => buildroot       
08-17-08 01:47  antialize      File Added: mplayer.patch                    
======================================================================
