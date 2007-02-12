From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:26 -0800
Subject: [Buildroot] [buildroot 0000762]: mtd package ignores $(DL_DIR)
Message-ID: <a4714e446ece81e635b9d470395f95fc@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=762 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   762
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-01-2006 07:35 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    mtd package ignores $(DL_DIR)
Description: 
The mtd.mk is ignoring the set ($DL_DIR), which means fit will fail when
DL_DIR is set to something other than dl


====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:28  
---------------------------------------------------------------------- 
applied, thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-06 07:35  bjdooks        New Issue                                    
03-01-06 07:35  bjdooks        Status                   new => assigned     
03-01-06 07:35  bjdooks        Assigned To               => uClibc          
03-01-06 07:35  bjdooks        File Added: mtd-pkg-missing-dl-dir.patch         
          
04-06-06 10:28  andersen       Note Added: 0001224                          
04-06-06 10:28  andersen       Status                   assigned => closed  
04-06-06 10:28  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
