From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 1 Oct 2007 21:18:06 -0700
Subject: [Buildroot] [buildroot 0001515]: Buildroot: Build of gmp fails
Message-ID: <18c6015cffc3d17f1654c49a1b424e07@bugs.uclibc.org>
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
Last Modified:              10-01-2007 21:18 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 09-30-07 05:09  
---------------------------------------------------------------------- 
Please try with current svn 

---------------------------------------------------------------------- 
 hwstar - 10-01-07 21:18  
---------------------------------------------------------------------- 
Ok. Gote the latest from SVN and it gmp now compiles correctly. 
Thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-07 17:18  hwstar         New Issue                                    
09-29-07 17:18  hwstar         Status                   new => assigned     
09-29-07 17:18  hwstar         Assigned To               => buildroot       
09-29-07 17:18  hwstar         File Added: theconfig                        
09-29-07 19:07  hwstar         Note Added: 0002803                          
09-30-07 05:09  bernhardf      Note Added: 0002804                          
10-01-07 21:18  hwstar         Note Added: 0002805                          
======================================================================
