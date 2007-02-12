From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:56 -0800
Subject: [Buildroot] [buildroot 0000704]: buildroot floppy is hanging after
	shohwing "-F Login"
Message-ID: <90e8955cb9d9b9ecc43c55710005a04a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=704 
====================================================================== 
Reported By:                alior101
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   704
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-08-2006 12:56 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    buildroot floppy is hanging after shohwing "-F
Login"
Description: 
ran the make menuconfig (with image file generated)
change the buildroot config into linux kernel 2.6.12
change the busybox config into supporting kernel for 2.6.12
make again and generated image ram again.
put on a floppy and boot in VMWare.
The kernel loads ok. The initrd file loads (fails on network but that's
ok) then show "-F Login"
whateven I type is doing nothing
after few seconds I see the "-F login" again

====================================================================== 

---------------------------------------------------------------------- 
 alior101 - 02-12-06 08:55  
---------------------------------------------------------------------- 
using busybox 1.1.0 and ulibc 0.9.28 the problem dissapear.

 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:45  
---------------------------------------------------------------------- 
Works with current uClibc and busybox, closing.
Thanks for the report! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-08-06 12:56  alior101       New Issue                                    
02-08-06 12:56  alior101       Status                   new => assigned     
02-08-06 12:56  alior101       Assigned To               => uClibc          
02-09-06 00:15  alior101       Issue Monitored: alior101                    
02-10-06 11:17  alior101       Note Added: 0001082                          
02-12-06 08:55  alior101       Note Edited: 0001082                         
01-21-07 06:45  bernhardf      Status                   assigned => closed  
01-21-07 06:45  bernhardf      Note Added: 0002018                          
01-21-07 06:45  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
