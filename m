From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 18 Feb 2008 02:03:12 -0800
Subject: [Buildroot] [buildroot 0002224]: microperl somewhat useless for me
Message-ID: <87da21b162bf3186572cc443d5db0fd4@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2224 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2224
Category:                   New Features
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-18-2008 02:03 PST
Last Modified:              02-18-2008 02:03 PST
====================================================================== 
Summary:                    microperl somewhat useless for me
Description: 
I intended to use perl to run some scripts on a firewall I am trying to
build.
One of my scripts needs the URI package to be installed.
To install URI I need to run perl Makefile.PL wich requires
ExtUtils::MakeMaker.pm
which via some files requires Config.pm which are missing from the perl
build.

Is it possible to make Config.pm available for inclusion in the microperl
modules list. It would be nice to be able to add CPAN packages at target.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-08 02:03  KHAksnes       New Issue                                    
02-18-08 02:03  KHAksnes       Status                   new => assigned     
02-18-08 02:03  KHAksnes       Assigned To               => buildroot       
======================================================================
