From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Mar 2007 00:10:16 -0800
Subject: [Buildroot] [buildroot 0001238]: Buildroot fails when building
	binutils 2.17 on an 32 bit Ubuntu edgy box.
Message-ID: <c8246b432534bbaf5597ddfc250eb0b9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-23-2007 20:22 PST
Last Modified:              03-08-2007 00:10 PST
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
03-08-07 00:10  bernhardf      Status                   assigned => closed  
======================================================================
