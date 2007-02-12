From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:50 -0800
Subject: [Buildroot] [buildroot 0000560]: SDL 1.2.9 won't compile with GCC4
	and Nasm
Message-ID: <b5389b3698047eac6f88f1a46acb3a01@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=560 
====================================================================== 
Reported By:                chainsaw
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   560
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-24-2005 02:04 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    SDL 1.2.9 won't compile with GCC4 and Nasm
Description: 
When using GCC4 and having Nasm installed in your system, SDL won't compile
because of undefined functions. This one-liner disables the use of Nasm.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-24-05 02:40  
---------------------------------------------------------------------- 
build failure isnt the only problems the nasm code has ... ive added your
patch, thanks for pointing it out 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-24-05 02:04  chainsaw       New Issue                                    
11-24-05 02:04  chainsaw       Status                   new => assigned     
11-24-05 02:05  chainsaw       Assigned To               => uClibc          
11-24-05 02:05  chainsaw       File Added: sdl-1.2.9-gcc4.patch                 
  
11-24-05 02:40  vapier         Note Added: 0000694                          
11-24-05 02:40  vapier         Status                   assigned => closed  
11-24-05 02:40  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
