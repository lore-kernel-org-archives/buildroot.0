From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Apr 2008 03:12:56 -0700
Subject: [Buildroot] [buildroot 0002854]: zlib.mk update for
	Makefile.autotools.in
Message-ID: <b6a8540f0a3997177dded556e7b560d5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2854 
====================================================================== 
Reported By:                Andrew Mahone
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2854
Category:                   Other
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-05-2008 03:12 PDT
Last Modified:              04-05-2008 03:12 PDT
====================================================================== 
Summary:                    zlib.mk update for Makefile.autotools.in
Description: 
patch vs current SVN to update zlib.mk to use Makefile.autotools.in. a bit
less clean because zlib doesn't really use autotools, but still (i think)
cleaner and more consistent than doing absolutely everything by hand.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-05-08 03:12  Andrew Mahone  New Issue                                    
04-05-08 03:12  Andrew Mahone  Status                   new => assigned     
04-05-08 03:12  Andrew Mahone  Assigned To               => buildroot       
04-05-08 03:12  Andrew Mahone  File Added: zlib-autotools.patch                 
  
======================================================================
