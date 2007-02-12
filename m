From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:05 -0800
Subject: [Buildroot] [buildroot 0000460]: Support for netkit-rsh [patch]
Message-ID: <bed713a2cf7f89c1235fc09ee786d048@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=460 
====================================================================== 
Reported By:                sho
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   460
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-01-2005 13:14 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Support for netkit-rsh [patch]
Description: 
The attached patch adds support for the netkit-rsh package to buildroot,
important for low-end systems that are too slow to run ssh servers (e.g.
386). Telnet is no alternative because it allows only interactive logins.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-01-05 13:14  sho            New Issue                                    
10-01-05 13:14  sho            Status                   new => assigned     
10-01-05 13:14  sho            Assigned To               => uClibc          
10-01-05 13:14  sho            File Added: buildroot-netkitrsh.patch            
       
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
