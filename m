From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 Jan 2008 04:54:47 -0800
Subject: [Buildroot] [buildroot 0001620]: [PATCH] Fix
	300-libstdc++-pic.patch for gcc-3.4.6
Message-ID: <8e59252590ac90f4010e49e2fdfef746@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1620 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1620
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-30-2007 06:04 PST
Last Modified:              01-08-2008 04:54 PST
====================================================================== 
Summary:                    [PATCH] Fix 300-libstdc++-pic.patch for gcc-3.4.6
Description: 
The libstdc++-pic patch for gcc-3.4.6 breaks installation of libstdc++ when
shared support is disabled. The attached patch fixes this the same way as 
for gcc-4.x.x.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 01-08-08 04:54  
---------------------------------------------------------------------- 
fixed in 20822 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-07 06:04  atle           New Issue                                    
11-30-07 06:04  atle           Status                   new => assigned     
11-30-07 06:04  atle           Assigned To               => buildroot       
11-30-07 06:04  atle           File Added: gcc-3.4.6-fix-libstc++-pic.patch     
              
01-08-08 04:54  vanokuten      Status                   assigned => closed  
01-08-08 04:54  vanokuten      Note Added: 0003429                          
======================================================================
