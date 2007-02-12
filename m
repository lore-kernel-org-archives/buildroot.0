From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:12 -0800
Subject: [Buildroot] [buildroot 0000432]: I would like compile buildroot
	with gcc 4.1.0 but URL is wrong
Message-ID: <39f27cbee46220e502ffd8658d7d6878@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=432 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   432
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-14-2005 14:11 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    I would like compile buildroot with gcc 4.1.0 but
URL is wrong
Description: 
--23:07:50-- 
http://mirrors.rcn.net/pub/sourceware/gcc/releases/gcc-4.1.0/gcc-4.1.0.tar.bz2
           => `/mnt/film2/ARM2/buildroot/dl/gcc-4.1.0.tar.bz2'
Resolving mirrors.rcn.net... hotovo.
Connecting to mirrors.rcn.net[207.172.2.141]:80... connected.
HTTP po?adavek odesl?n, program ?ek? na odpov?? ... 404 Not Found
23:07:51 CHYBA 404: Not Found.

I cannot download gcc 4.1.0 URL is wrong or mirror is not synced
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-14-05 18:35  
---------------------------------------------------------------------- 
there is no 4.1.0 release, you'll have to grab a snapshot and rename it
yourself 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-14-05 14:11  marvin         New Issue                                    
09-14-05 14:11  marvin         Status                   new => assigned     
09-14-05 14:11  marvin         Assigned To               => uClibc          
09-14-05 18:35  vapier         Note Added: 0000533                          
09-14-05 18:35  vapier         Status                   assigned => closed  
09-14-05 18:35  vapier         Resolution               open => won't fix   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
