From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 11 Dec 2007 12:22:11 -0800
Subject: [Buildroot] [buildroot 0001621]: [PATCH] Create GNU_TARGET_NAME
	links for elf2flt binaries
Message-ID: <bb75032612225b14b1aa6b2783046ea4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1621 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1621
Category:                   Other
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-30-2007 06:39 PST
Last Modified:              12-11-2007 12:22 PST
====================================================================== 
Summary:                    [PATCH] Create GNU_TARGET_NAME links for elf2flt
binaries
Description: 
The attached patch enables creation of $(GNU_TARGET_NAME)-<prog> symlinks
for the elft2flt binaries.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-11-07 12:22  
---------------------------------------------------------------------- 
fixed in 20641 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-07 06:39  atle           New Issue                                    
11-30-07 06:39  atle           Status                   new => assigned     
11-30-07 06:39  atle           Assigned To               => buildroot       
11-30-07 06:39  atle           File Added: elf2flt-GNU_TARGET_NAME-links.diff   
                
12-11-07 12:22  vanokuten      Status                   assigned => closed  
12-11-07 12:22  vanokuten      Note Added: 0003084                          
======================================================================
