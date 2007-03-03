From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 2 Mar 2007 23:49:31 -0800
Subject: [Buildroot] [buildroot 0001225]: Bump genext2fs
Message-ID: <c002cd14f33f968ea9fc4693c252d158@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1225 
====================================================================== 
Reported By:                alexer
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1225
Category:                   New Features
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-16-2007 05:19 PST
Last Modified:              03-02-2007 23:49 PST
====================================================================== 
Summary:                    Bump genext2fs
Description: 
Just a new version, no more CVS-patches
====================================================================== 

---------------------------------------------------------------------- 
 alexer - 02-16-07 05:23  
---------------------------------------------------------------------- 
Uploaded the wrong patch first :/ Sorry about that 

---------------------------------------------------------------------- 
 holin - 03-02-07 23:49  
---------------------------------------------------------------------- 
Could the "-l" in "du -l..." in the ext2root.mk file perhaps be removed,
since genext2fs claims to support hardlinks now? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-16-07 05:19  alexer         New Issue                                    
02-16-07 05:19  alexer         Status                   new => assigned     
02-16-07 05:19  alexer         Assigned To               => buildroot       
02-16-07 05:19  alexer         File Added: genext2fs-1.4-upgrade.patch          
         
02-16-07 05:23  alexer         File Added: genext2fs_upgrade.patch              
     
02-16-07 05:23  alexer         Note Added: 0002172                          
03-02-07 23:49  holin          Note Added: 0002199                          
======================================================================
