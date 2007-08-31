From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 31 Aug 2007 07:03:36 -0700
Subject: [Buildroot] [buildroot 0001480]: mpfr site path changed
Message-ID: <62df81265b7ede3b824d776b2a5ab74b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1480 
====================================================================== 
Reported By:                erikv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1480
Category:                   Website
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-31-2007 07:03 PDT
Last Modified:              08-31-2007 07:03 PDT
====================================================================== 
Summary:                    mpfr site path changed
Description: 
mpfr-2.2.1 is no longer found in
MPFR_SITE:=http://www.mpfr.org/mpfr-current, it is in
http://www.mpfr.org/mpfr-2.2.1

simple temporary solution is to change MPFR_SITE in packages/mpfr/mpfr.mk
to the right path by hand
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-31-07 07:03  erikv          New Issue                                    
08-31-07 07:03  erikv          Status                   new => assigned     
08-31-07 07:03  erikv          Assigned To               => buildroot       
======================================================================
