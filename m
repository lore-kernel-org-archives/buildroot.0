From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:51 -0800
Subject: [Buildroot] [buildroot 0000287]: (buildroot) cramfs fetches from
	non-existent mirror [patch enclosed]
Message-ID: <3735f8d965e9f2c4058d99c20c929b73@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=287 
====================================================================== 
Reported By:                db
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   287
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-04-2005 19:01 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    (buildroot) cramfs fetches from non-existent mirror
[patch enclosed]
Description: 
The mirror specified for fetching the cramfs tools is
no longer active.  This just changes the build to fetch
from a mirror that's active and has the files.
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 06-09-05 05:23  
---------------------------------------------------------------------- 
Rather than applying this, I added a buildroot config option to select your
preferred sourceforge mirror, which I hope will provide a more satisfactory
and long term solution, as sourceforge mirrors tend to come and go... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-04-05 19:01  db             New Issue                                    
06-04-05 19:01  db             File Added: br2-cramfs.patch                    
06-09-05 05:23  andersen       Note Added: 0000240                          
06-09-05 05:24  andersen       Status                   assigned => closed  
06-09-05 05:24  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
