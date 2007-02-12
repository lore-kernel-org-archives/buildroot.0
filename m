From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:45 -0800
Subject: [Buildroot] [buildroot 0000578]: Package ttcp can't be
	downloaded/installed
Message-ID: <4c9f8e210601509de57b4ec14ac3ae75@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=578 
====================================================================== 
Reported By:                boris64
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   578
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-04-2005 07:59 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    Package ttcp can't be downloaded/installed
Description: 
The packet ttcp can't be downloaded/installed because
the file "buildroot/package/ttcp/ttcp.mk" contains a wrong url.

wrong:
TTCP_SOURCE_URL=http://ftp.sunet.se/ftp/pub/network/monitoring/ttcp/ttcp.c

this can be fixed by changing the url in line 7 to:
TTCP_SOURCE_URL=http://ftp.sunet.se/pub/network/monitoring/ttcp/ttcp.c
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 13:02  
---------------------------------------------------------------------- 
correct as of 13459 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-04-05 07:59  boris64        New Issue                                    
12-04-05 07:59  boris64        Status                   new => assigned     
12-04-05 07:59  boris64        Assigned To               => uClibc          
12-04-05 08:35  boris64        Issue Monitored: boris64                     
01-20-06 13:02  prpplague      Note Added: 0000966                          
01-20-06 13:02  prpplague      Status                   assigned => resolved
01-20-06 13:02  prpplague      Resolution               open => fixed       
03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
