From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 Jul 2008 05:21:29 -0700
Subject: [Buildroot] [buildroot 0004224]: DirectFB Makefile does not support
	1.0.x / 1.2.x and Examples not supported
Message-ID: <9bbaa85f64923ebf768b6d8d0c7bdea9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4224 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4224
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-21-2008 05:03 PDT
Last Modified:              07-21-2008 05:21 PDT
====================================================================== 
Summary:                    DirectFB Makefile does not support 1.0.x / 1.2.x and
Examples not supported
Description: 
DirectFB makefile supports out of date version and does not support the
building of examples. 
This patch adds support for 1.0.X and 1.2.x building and DirectFB examples
as well
====================================================================== 

---------------------------------------------------------------------- 
 Correa - 07-21-08 05:21  
---------------------------------------------------------------------- 
Is there a reason to support multiple versions? If possible, we would
rather avoid having to choose versions and keep the latest one only. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-21-08 05:03  daniellaird    New Issue                                    
07-21-08 05:03  daniellaird    Status                   new => assigned     
07-21-08 05:03  daniellaird    Assigned To               => buildroot       
07-21-08 05:03  daniellaird    File Added: directfb_update.patch                
   
07-21-08 05:21  Correa         Note Added: 0009874                          
======================================================================
