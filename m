From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 May 2007 05:01:06 -0700
Subject: [Buildroot] [buildroot 0001355]: new package ncftp
Message-ID: <48a95011651c4b5723d2ede58bfae5eb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1355 
====================================================================== 
Reported By:                razzor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1355
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-18-2007 03:55 PDT
Last Modified:              05-22-2007 05:01 PDT
====================================================================== 
Summary:                    new package ncftp
Description: 
ncftp is a cli ftp client with background queuing and bookmark support.

This is my first package for buildroot, so feedback is appreciated.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 05-22-07 05:01  
---------------------------------------------------------------------- 
Thanks! Added as r18668.
Package looks good except for you using install -s which uses the system
strip instead of the buildroot (cross-)strip and a trailing space in
Config.in. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-18-07 03:55  razzor         New Issue                                    
05-18-07 03:55  razzor         Status                   new => assigned     
05-18-07 03:55  razzor         Assigned To               => buildroot       
05-18-07 03:55  razzor         File Added: ncftp.patch                      
05-22-07 05:01  jacmet         Status                   assigned => closed  
05-22-07 05:01  jacmet         Note Added: 0002395                          
======================================================================
