From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:28 -0800
Subject: [Buildroot] [buildroot 0000522]: busybox doesn't contain a udhcp
	script
Message-ID: <207621153a0b9e5df7d06e836b2a77fb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=522 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   522
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 10:02 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    busybox doesn't contain a udhcp script
Description: 
udhcp requires a script installed in /usr/share/udhcp/default, but busybox
doesn't come with one.  This installs a good sample script there if
busybox builds the udhcp binary.  Perhaps this belongs in busybox instead,
though it borders on something distribution specific.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:39  
---------------------------------------------------------------------- 
This works in current svn (r17050, currently) with busybox-1.2.2.1 and
busybox-trunk. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 10:02  akvadrako      New Issue                                    
10-28-05 10:02  akvadrako      Status                   new => assigned     
10-28-05 10:02  akvadrako      Assigned To               => uClibc          
10-28-05 10:02  akvadrako      File Added: br-busybox-udhcp.patch               
    
12-22-06 04:39  bernhardf      Status                   assigned => closed  
12-22-06 04:39  bernhardf      Note Added: 0001918                          
12-22-06 04:39  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
