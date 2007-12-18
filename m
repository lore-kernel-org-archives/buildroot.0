From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 18 Dec 2007 07:13:19 -0800
Subject: [Buildroot] [buildroot 0001699]: [PATCH] Improves Qtopia build.
Message-ID: <463ea190e4f4b4f5d86ca1e6ee7c657a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1699 
====================================================================== 
Reported By:                Correa
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1699
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             12-11-2007 15:11 PST
Last Modified:              12-18-2007 07:13 PST
====================================================================== 
Summary:                    [PATCH] Improves Qtopia build.
Description: 
  This patch greatly improves qtopia build, with a single build step
(instead of the build twice in HEAD). Also adds new make menu options:
Allows for static or shared build, lets you decide to compile with
libjpeg or zlib (shared linked with system lib, or the static version
provided with qtopia). It also fixes the build of qtopia based
projects, by adding the toolchain paths to the qmake.conf files.

  The qtopia-4.3.2-add-avr32-arch.patch is more or less the same as
the patch for the other version, except that this one is a single
patch for both the code support and the -qatomic-header-to-header-list
thing.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-18-07 07:13  
---------------------------------------------------------------------- 
fixed in 20658 rev, thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-11-07 15:11  Correa         New Issue                                    
12-11-07 15:11  Correa         Status                   new => assigned     
12-11-07 15:11  Correa         Assigned To               => buildroot       
12-11-07 15:11  Correa         File Added: qtopia.patch                     
12-11-07 15:11  Correa         File Added: qtopia-4.3.2-add-avr32-arch.patch    
               
12-18-07 07:13  vanokuten      Status                   assigned => closed  
12-18-07 07:13  vanokuten      Note Added: 0003254                          
======================================================================
