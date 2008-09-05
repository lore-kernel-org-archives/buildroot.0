From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 4 Sep 2008 22:25:32 -0700
Subject: [Buildroot] [buildroot 0004264]: MTD utils and LZO are out of date
	(fix this)
Message-ID: <b2365e8b2193e247be02809a33c7bab7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4264 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4264
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-23-2008 02:45 PDT
Last Modified:              09-04-2008 22:25 PDT
====================================================================== 
Summary:                    MTD utils and LZO are out of date (fix this)
Description: 
Update MTD utils to be 1.2.0.  This requires an update to lzo-2.03 which
now uses buildroot autotools
makefile. 
MTD-utils 1.2.0 means that there is no longer a need for mtd-utils.git.  
MTD-utils 1.2.0 has a  patch that means if you select no UBI targets then
it will stop the compilation
of UBI tools.  This stops older kernels breaking (<2.6.25 i think)
If you select UBI targets then patch is not applied.

====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 09-04-08 22:25  
---------------------------------------------------------------------- 
I don't see any particular need to remove mtd-utils.git - it may be useful
again in the future. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 02:45  daniellaird    New Issue                                    
07-23-08 02:45  daniellaird    Status                   new => assigned     
07-23-08 02:45  daniellaird    Assigned To               => buildroot       
07-23-08 02:45  daniellaird    File Added:
update_mtd_utils_lzo_remove_mtd_utils_git.patch                    
09-04-08 22:25  hmoffatt       Note Added: 0011104                          
======================================================================
