From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:37 -0800
Subject: [Buildroot] [buildroot 0000537]: mkdosfs auto-build from buildroot
	checkout 12813 from 2005-11-07 fails
Message-ID: <a6b54413894788c027cdef3f245b335d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=537 
====================================================================== 
Reported By:                alemc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   537
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-09-2005 13:50 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    mkdosfs auto-build from buildroot checkout 12813
from 2005-11-07 fails
Description: 
mkdosfs auto-build from buildroot checkout 12813 from 2005-11-07 fails with
the following error message:
mkdosfs.c:50:24: ../version.h: No such file or directory
mkdosfs.c: In function `main':
mkdosfs.c:1415: error: parse error before "VERSION"

Creating a version.h file in build_i386/dosfstools-2.8 with #define
VERSION "xyz" and #define VERSION_DATE "a_date" works as a temporary
workaround
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-29-05 03:30  
---------------------------------------------------------------------- 
ver bumped dosfstools from 2.8 to 2.11 and should fix this 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-09-05 13:50  alemc          New Issue                                    
11-09-05 13:50  alemc          Status                   new => assigned     
11-09-05 13:50  alemc          Assigned To               => uClibc          
12-29-05 03:30  vapier         Note Added: 0000827                          
12-29-05 03:30  vapier         Status                   assigned => closed  
12-29-05 03:30  vapier         Resolution               open => fixed       
12-29-05 03:30  vapier         Description Updated                          
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
