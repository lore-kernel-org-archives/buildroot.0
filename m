From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 29 Sep 2007 19:07:23 -0700
Subject: [Buildroot] [buildroot 0001515]: Buildroot: Build of gmp fails
Message-ID: <170c31dcf87d5a58799f282630f2d1e7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1515 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1515
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2007 17:18 PDT
Last Modified:              09-29-2007 19:07 PDT
====================================================================== 
Summary:                    Buildroot: Build of gmp fails
Description: 
When building with all options at default except for processor type =i386
and sub architecture type =i586, gmp refuses to make, and the build
process aborts with the following error:

/bin/sh: line 1: --remove-section=.comment: command not found

Config file attached.
====================================================================== 

---------------------------------------------------------------------- 
 hwstar - 09-29-07 19:07  
---------------------------------------------------------------------- 
Buildroot snapshot 9/29/07.
Host: Ubuntu 7.04 Feisty Fawn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-07 17:18  hwstar         New Issue                                    
09-29-07 17:18  hwstar         Status                   new => assigned     
09-29-07 17:18  hwstar         Assigned To               => buildroot       
09-29-07 17:18  hwstar         File Added: theconfig                        
09-29-07 19:07  hwstar         Note Added: 0002803                          
======================================================================
