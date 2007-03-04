From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Mar 2007 02:21:23 -0800
Subject: [Buildroot] [buildroot 0001252]: makedevs does not compile on Mac
	OS X
Message-ID: <818c7cf8d1ca3be48d945c630363de0e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1252 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1252
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-02-2007 13:30 PST
Last Modified:              03-04-2007 02:21 PST
====================================================================== 
Summary:                    makedevs does not compile on Mac OS X
Description: 
Mac OS X does not have sysmacros.h and hence makedevs does not compile.
Attached a patch to fix that. I'm not sure though, whether sysmacros.h
include could be removed altogether - it doesn't seem to be used
anymore(?).
====================================================================== 

---------------------------------------------------------------------- 
 holin - 03-04-07 02:21  
---------------------------------------------------------------------- 
OS X seems to give EISDIR instead of EEXIST for existing directories.
Updated the patch to take that into account. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-02-07 13:30  holin          New Issue                                    
03-02-07 13:30  holin          Status                   new => assigned     
03-02-07 13:30  holin          Assigned To               => buildroot       
03-02-07 13:30  holin          File Added: buildroot-070302-makedevs.patch      
             
03-04-07 02:20  holin          File Added: buildroot-070304-makedevs.patch      
             
03-04-07 02:21  holin          Note Added: 0002200                          
======================================================================
