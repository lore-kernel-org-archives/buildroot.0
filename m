From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 13 Aug 2008 00:19:39 -0700
Subject: [Buildroot] [buildroot 0002254]: util-linux fails to compile for
	i686 using svn(21060) version of buildroot
Message-ID: <ce6752c9e8b4cbcf23cfb7cc30562933@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2254 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2254
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-19-2008 02:39 PST
Last Modified:              08-13-2008 00:19 PDT
====================================================================== 
Summary:                    util-linux fails to compile for i686 using
svn(21060) version of buildroot
Description: 
util-linux fails to compile and is required by development platform builds.
====================================================================== 

---------------------------------------------------------------------- 
 pepe - 08-13-08 00:19  
---------------------------------------------------------------------- 
The patch adds util-linux-ng to buildroot.

It conflicts with util-linux and requires either e2fsprogs or udev. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-08 02:39  KHAksnes       New Issue                                    
02-19-08 02:39  KHAksnes       Status                   new => assigned     
02-19-08 02:39  KHAksnes       Assigned To               => buildroot       
08-13-08 00:16  pepe           Issue Monitored: pepe                        
08-13-08 00:18  pepe           File Added: util-linux-ng.patch                  
 
08-13-08 00:19  pepe           Note Added: 0010394                          
======================================================================
