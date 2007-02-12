From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:30 -0800
Subject: [Buildroot] [buildroot 0000382]: dhcp.mk references version 3.0.2
	which doesn't exist at ftp.isc.org
Message-ID: <902d06453c9a793f37f46aaf4d0a86cd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=382 
====================================================================== 
Reported By:                jglasser
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   382
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-12-2005 05:28 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    dhcp.mk references version 3.0.2 which doesn't exist
at ftp.isc.org
Description: 
dhcp.mk references dhcp-3.0.2.tar.gz at ftp://ftp.isc.org/isc/dhcp. 
Version present on the site is 3.0.3.  Trivial, but I keep running into
it... 
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 00:57  
---------------------------------------------------------------------- 
thanks, dhcp is updated now 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-12-05 05:28  jglasser       New Issue                                    
08-12-05 05:28  jglasser       Status                   new => assigned     
08-12-05 05:28  jglasser       Assigned To               => uClibc          
08-12-05 05:29  jglasser       Issue Monitored: jglasser                    
08-12-05 05:29  jglasser       Issue End Monitor: jglasser                    
08-28-05 00:57  vapier         Note Added: 0000449                          
08-28-05 00:57  vapier         Status                   assigned => closed  
08-28-05 00:57  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
