From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:11 -0800
Subject: [Buildroot] [buildroot 0000437]: iptables don't find
	uClibc_config.h thus it's impossible to get ip6tables
Message-ID: <1228a89cbadef42ec1fc9a829b31b0b7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=437 
====================================================================== 
Reported By:                steelman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   437
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-18-2005 10:31 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    iptables don't find uClibc_config.h thus it's
impossible to get ip6tables
Description: 
iptables.mk checks if uClibc has been compiled with or without IPv6 support
and decides to add support in iptables or not. the enclosed patch fixes
this problem
====================================================================== 

---------------------------------------------------------------------- 
 jocke - 09-18-05 10:48  
---------------------------------------------------------------------- 
fixed in svn. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-18-05 10:31  steelman       New Issue                                    
09-18-05 10:31  steelman       Status                   new => assigned     
09-18-05 10:31  steelman       Assigned To               => uClibc          
09-18-05 10:32  steelman       File Added: dupa.patch                       
09-18-05 10:48  jocke          Status                   assigned => closed  
09-18-05 10:48  jocke          Note Added: 0000548                          
09-18-05 10:48  jocke          Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
