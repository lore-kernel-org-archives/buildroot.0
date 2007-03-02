From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 2 Mar 2007 13:06:31 -0800
Subject: [Buildroot] [buildroot 0001249]: buildroot cannot correctly handle
	sed differencies on Mac OS X
Message-ID: <1270fcc6d67531b9686570a2d6346fc1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1249 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1249
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-02-2007 13:06 PST
Last Modified:              03-02-2007 13:06 PST
====================================================================== 
Summary:                    buildroot cannot correctly handle sed differencies
on Mac OS X
Description: 
Mac OS X native sed does not seem good for buildroot usage and buildroot
cannot detect that. Attached three patches to fix the sed detection and
make buildroot use either a third-party gsed/gnused or build gnu sed
locally.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-07 13:06  holin          New Issue                                    
03-02-07 13:06  holin          Status                   new => assigned     
03-02-07 13:06  holin          Assigned To               => buildroot       
03-02-07 13:06  holin          File Added: buildroot-070225-sed-check.patch     
              
======================================================================
