From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:34 -0800
Subject: [Buildroot] [buildroot 0001187]: PATCH: netplug package
Message-ID: <b97a2626aef3e9baf081c53804271a2d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1187 
====================================================================== 
Reported By:                janlana
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1187
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-31-2007 02:40 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    PATCH: netplug package
Description: 
netplug's Makefile uses strict build flag -Werror. because gcc 4.2 reports
some differ in signedness warnings the build failed. 

The attached patch remove '-Werror' flag
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-31-07 02:40  janlana        New Issue                                    
01-31-07 02:40  janlana        Status                   new => assigned     
01-31-07 02:40  janlana        Assigned To               => uClibc          
01-31-07 02:40  janlana        File Added: netplug_build.patch                  
 
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
