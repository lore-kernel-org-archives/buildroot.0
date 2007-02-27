From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 26 Feb 2007 19:54:09 -0800
Subject: [Buildroot] [buildroot 0001238]: Buildroot fails when building
	binutils 2.17 on an 32 bit Ubuntu edgy box.
Message-ID: <aa175cf58fc74619016138538a4e32b7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1238 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1238
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-23-2007 20:22 PST
Last Modified:              02-26-2007 19:54 PST
====================================================================== 
Summary:                    Buildroot fails when building binutils 2.17 on an 32
bit Ubuntu edgy box.
Description: 
Buildroot fails when building binutils 2.17 on an Ubuntu edgy box.
Originally I noticed the problem when using a snapshot dated 1/7/07, so I
tried downloading the latest buildroot snapshot (2/23/07) and the build
failure occurs in exactly the same spot. My .config file is included below
so the the problem can be reproduced.
The target system is an i586 via mini-itx motherboard. 

The buildroot package dated 1/7/07 did compile successfully on a Fedora
Core 4 box,  and only when I updated that box to Ubuntu Edgy did I see
this build failure crop up.

====================================================================== 

---------------------------------------------------------------------- 
 hwstar - 02-26-07 19:54  
---------------------------------------------------------------------- 
*Solved* 

Binutils-2.17 requires makeinfo (part of the texinfo package) to be
installed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-23-07 20:22  hwstar         New Issue                                    
02-23-07 20:22  hwstar         Status                   new => assigned     
02-23-07 20:22  hwstar         Assigned To               => buildroot       
02-23-07 20:22  hwstar         File Added: failed-build-config                  
 
02-24-07 10:56  hwstar         Issue Monitored: hwstar                      
02-26-07 19:54  hwstar         Note Added: 0002189                          
======================================================================
