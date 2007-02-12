From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:14 -0800
Subject: [Buildroot] [buildroot 0000159]: More MTD fixes
Message-ID: <a30e94926d6e143e7ba151a3fad8125c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=159 
====================================================================== 
Reported By:                pgrayson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   159
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2005 18:12 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    More MTD fixes
Description: 
This patch includes a couple of fixes for the buildroot mtd package.

 * flash_eraseall now installs correctly
 * nanddump now installs correctly
 * MTD tools installed to the target are now stripped

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-05 18:12  pgrayson       New Issue                                    
03-15-05 18:12  pgrayson       File Added: buildroot-mtd-fix.patch              
     
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
01-23-06 13:38  prpplague      Status                   assigned => resolved
01-23-06 13:38  prpplague      Resolution               open => fixed       
01-23-06 13:38  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
