From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:21 -0800
Subject: [Buildroot] [buildroot 0000888]: FLOAT: Toolchain build fails on
	non-FPU ARM
Message-ID: <a258642485815aeb9847d2ae47f37c0b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=888 
====================================================================== 
Reported By:                fmoya
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   888
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-31-2006 02:17 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    FLOAT: Toolchain build fails on non-FPU ARM
Description: 
t-linux and t-linux-uclibc are missing the new hand-coded FP functions of
newer GCCs.  This triggers a link failure due to unresolved symbols during
uClibc compilation.

====================================================================== 

---------------------------------------------------------------------- 
 shail - 06-28-06 04:05  
---------------------------------------------------------------------- 
after puting this patch in config/arm/t-linux, in final build of gcc... ld
gives error as following. 

libgcc2......./multiple defination of __floatundidf...

unable to fix it. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-31-06 02:17  fmoya          New Issue                                    
05-31-06 02:17  fmoya          Status                   new => assigned     
05-31-06 02:17  fmoya          Assigned To               => uClibc          
06-28-06 04:05  shail          Note Added: 0001468                          
10-09-06 12:24  jruere         Issue Monitored: jruere                      
02-04-07 09:14  bernhardf      Summary                  Toolchain build fails on
non-FPU ARM => FLOAT: Toolchain build fails on non-FPU ARM
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
