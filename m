From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 31 Aug 2007 08:07:31 -0700
Subject: [Buildroot] [buildroot 0001480]: mpfr site path changed
Message-ID: <8e1b2f8540b63b8784b571488b1b0cd2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-31-2007 07:03 PDT
Last Modified:              08-31-2007 08:07 PDT
====================================================================== 
Summary:                    mpfr site path changed
Description: 
mpfr-2.2.1 is no longer found in
MPFR_SITE:=http://www.mpfr.org/mpfr-current, it is in
http://www.mpfr.org/mpfr-2.2.1

simple temporary solution is to change MPFR_SITE in packages/mpfr/mpfr.mk
to the right path by hand
====================================================================== 

---------------------------------------------------------------------- 
 hcegtvedt - 08-31-07 07:07  
---------------------------------------------------------------------- 
I have submitted a patch for this, please see
http://buildroot.uclibc.org/lists/buildroot/2007-August/004826.html 

---------------------------------------------------------------------- 
 erikv - 08-31-07 07:55  
---------------------------------------------------------------------- 
Thank you for the quick fix! 

---------------------------------------------------------------------- 
 bernhardf - 08-31-07 08:07  
---------------------------------------------------------------------- 
The suggested quickfix is not the proper thing to do.
We really want the current, stable gmp and mpfr and not an old, stale
one.

Do a svn up 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-31-07 07:03  erikv          New Issue                                    
08-31-07 07:03  erikv          Status                   new => assigned     
08-31-07 07:03  erikv          Assigned To               => buildroot       
08-31-07 07:07  hcegtvedt      Note Added: 0002703                          
08-31-07 07:55  erikv          Note Added: 0002704                          
08-31-07 08:07  bernhardf      Status                   assigned => closed  
08-31-07 08:07  bernhardf      Note Added: 0002705                          
======================================================================
