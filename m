From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:50 -0800
Subject: [Buildroot] [buildroot 0000083]: atching package netsnmp fails
Message-ID: <5863e7a7bc76c81e1476bbab5ef49ada@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=83 
====================================================================== 
Reported By:                rickb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   83
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-04-2005 09:16 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    atching package netsnmp fails
Description: 
this is the error:
Applying package/netsnmp//netsnmp.patch using plaintext: 
patching file agent/mibgroup/host/hr_system.c
Hunk http://busybox.net/bugs/view.php?id=1 FAILED at 286.
1 out of 1 hunk FAILED -- saving rejects to file
agent/mibgroup/host/hr_system.c.rej
patching file configure.in
Hunk http://busybox.net/bugs/view.php?id=1 succeeded at 2019 (offset 154 lines).
Patch failed!  Please fix package/netsnmp//netsnmp.patch!
make: ***
[/usr/src/u-linux/buildroot-cvs/buildroot/build_i386/net-snmp-5.1.2/.unpacked]
Error 1

Attached patch resolve issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-04-05 09:16  rickb          New Issue                                    
02-04-05 09:16  rickb          File Added: netsnmp.patch                    
03-16-05 12:15  andersen       Status                   new => assigned     
03-16-05 12:15  andersen       Assigned To               => uClibc          
01-25-06 06:10  prpplague      Status                   assigned => resolved
01-25-06 06:10  prpplague      Resolution               open => fixed       
01-25-06 06:10  prpplague      Additional Information Updated                   

03-08-06 16:53  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
