From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:49 -0800
Subject: [Buildroot] [buildroot 0000289]: net-snmp build failure in
	buildroot svn trunk
Message-ID: <03bc9501582392ebeca3ce55b8937676@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=289 
====================================================================== 
Reported By:                nine
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   289
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-05-2005 13:31 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    net-snmp build failure in buildroot svn trunk
Description: 
Debian have removed version 5.1.2 patchlevel 6 from their FTP servers,
replacing it with 5.1.2 patchlevel 6.1.

The resulting patch applies cleanly, but one of the buildroot patches does
not apply cleanly unless modified.

Patch is included to fix this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-05-05 13:31  nine           New Issue                                    
06-05-05 13:31  nine           File Added: netsnmp-build.patch                  
 
06-09-05 05:33  andersen       Status                   assigned => closed  
06-09-05 05:33  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
