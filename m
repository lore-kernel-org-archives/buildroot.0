From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:15 -0800
Subject: [Buildroot] [buildroot 0000676]: fix build problem in mtd
Message-ID: <4d6a3e0ebd83c62e1a2781318d779b8b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=676 
====================================================================== 
Reported By:                jp-embedded
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   676
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-01-2006 00:37 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    fix build problem in mtd
Description: 
replaces 'dl' with '$(DL_DIR) to make mtd build when the download dir is
not configured to default
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:51  
---------------------------------------------------------------------- 
fixed thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-01-06 00:37  jp-embedded    New Issue                                    
02-01-06 00:37  jp-embedded    Status                   new => assigned     
02-01-06 00:37  jp-embedded    Assigned To               => uClibc          
02-01-06 00:37  jp-embedded    File Added: mtd-jp-20060131.patch                
   
02-21-06 02:32  hmargies       Issue Monitored: hmargies                    
04-06-06 10:51  andersen       Note Added: 0001232                          
04-06-06 10:51  andersen       Status                   assigned => closed  
04-06-06 10:51  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
