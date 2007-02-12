From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:23 -0800
Subject: [Buildroot] [buildroot 0000181]: make defconfig is broken
Message-ID: <16b8335246098eb354909441717e9119@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=181 
====================================================================== 
Reported By:                david_bachelart
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   181
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-22-2005 13:55 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    make defconfig is broken
Description: 
make defconfig is trying to find "defconfig" file instead of ".defconfig". 
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:17  
---------------------------------------------------------------------- 
thanks, fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-22-05 13:55  david_bachelartNew Issue                                    
03-22-05 13:55  david_bachelartFile Added: defconfig.patch                    
08-28-05 01:17  vapier         Note Added: 0000460                          
08-28-05 01:17  vapier         Status                   assigned => closed  
08-28-05 01:17  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
