From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:14 -0800
Subject: [Buildroot] [buildroot 0000707]: net-snmp_5.1.2-6.1.diff.gz is not
	on ftp.debian.org
Message-ID: <ec839a0f4a812d599bb33007d463eaf3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=707 
====================================================================== 
Reported By:                clucas
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   707
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-09-2006 04:39 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    net-snmp_5.1.2-6.1.diff.gz is not on ftp.debian.org
Description: 
--13:34:50-- 
http://ftp.debian.org/debian/pool/main/n/net-snmp//net-snmp_5.1.2-6.1.diff.gz
           =>
`/home/clucas/abc/brooter/buildroot/dl/net-snmp_5.1.2-6.1.diff.gz'
R?solution de ftp.debian.org... 128.101.80.133
Connecting to ftp.debian.org|128.101.80.133|:80... connect?.
requ?te HTTP transmise, en attente de la r?ponse... 404 Not Found
13:34:51 ERREUR 404: Not Found.

It is changed to :
"http://ftp.debian.org/debian/pool/main/n/net-snmp/net-snmp_5.1.2-6.2.diff.gz"
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-09-06 04:39  clucas         New Issue                                    
02-09-06 04:39  clucas         Status                   new => assigned     
02-09-06 04:39  clucas         Assigned To               => uClibc          
02-10-06 12:22  prpplague      Status                   assigned => resolved
02-10-06 12:22  prpplague      Resolution               open => fixed       
02-10-06 12:22  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
