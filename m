From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 2 Oct 2007 04:04:22 -0700
Subject: [Buildroot] [buildroot 0001515]: Buildroot: Build of gmp fails
Message-ID: <616a2e0a6afb1e7626d995db31c2ccb5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-29-2007 17:18 PDT
Last Modified:              10-02-2007 04:04 PDT
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
Ok. Got the latest from SVN and it gmp now compiles correctly. 
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
10-01-07 21:18  hwstar         Note Edited: 0002805                         
10-02-07 04:04  bernhardf      Status                   assigned => closed  
======================================================================
