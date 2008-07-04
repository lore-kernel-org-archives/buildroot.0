From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 3 Jul 2008 19:24:06 -0700
Subject: [Buildroot] [buildroot 0003594]: ATK does not always require X
	support to be compiled
Message-ID: <eaffd330ef6a621aef1e249bf67bcac2@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3594 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3594
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-03-2008 05:07 PDT
Last Modified:              07-03-2008 19:24 PDT
====================================================================== 
Summary:                    ATK does not always require X support to be compiled
Description: 
ATK does not always require X support to be enabled (DirectFB only for
instance)
====================================================================== 

---------------------------------------------------------------------- 
 Correa - 07-03-08 19:24  
---------------------------------------------------------------------- 
Applied and tested (build) on AVR32. Thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 05:07  daniellaird    New Issue                                    
06-03-08 05:07  daniellaird    Status                   new => assigned     
06-03-08 05:07  daniellaird    Assigned To               => buildroot       
06-03-08 05:07  daniellaird    File Added: atk_no_x.patch                    
07-03-08 19:24  Correa         Status                   assigned => resolved
07-03-08 19:24  Correa         Resolution               open => fixed       
07-03-08 19:24  Correa         Note Added: 0008914                          
======================================================================
