From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 23 Feb 2007 08:22:10 -0800
Subject: [Buildroot] [buildroot 0001235]: don't do legacy IO on ARM or S/390
	(Xorg crashes)
Message-ID: <224d2744209136e51b802bee8d92ad99@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1235 
====================================================================== 
Reported By:                rgenoud
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1235
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-21-2007 06:30 PST
Last Modified:              02-23-2007 08:22 PST
====================================================================== 
Summary:                    don't do legacy IO on ARM or S/390 (Xorg crashes)
Description: 
on ARM, Xorg crashes with the error :
xf86EnableIOPorts: Failed to set IOPL for I/O
at the very beginning.
This was originaly pointed out by Bastian Blank
I've just modified his patch for X11R6.8.2 to eliminate the fuzzes.


====================================================================== 

---------------------------------------------------------------------- 
 rgenoud - 02-23-07 08:22  
---------------------------------------------------------------------- 
Sorry, I missed a line.
The file  patchIOPL is incomplete.
only xorg-iopl.patch is good. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-21-07 06:30  rgenoud        New Issue                                    
02-21-07 06:30  rgenoud        Status                   new => assigned     
02-21-07 06:30  rgenoud        Assigned To               => buildroot       
02-21-07 06:30  rgenoud        File Added: patchIOPL                        
02-23-07 08:20  rgenoud        File Added: xorg-iopl.patch                    
02-23-07 08:22  rgenoud        Note Added: 0002186                          
======================================================================
