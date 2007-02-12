From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:59 -0800
Subject: [Buildroot] [buildroot 0000162]: Busybox and uClibc configuration
	files fix
Message-ID: <79eebd1ddc99bb907b728807b4dcbc0d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=162 
====================================================================== 
Reported By:                pgrayson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   162
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2005 18:21 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Busybox and uClibc configuration files fix
Description: 
This patch provides fixes to uclibc.mk and busybox.mk to be able to
successfully override UCLIBC_CONFIG_FILE and BUSYBOX_CONFIG_FILE,
respectively. These were not able to be overridden correctly by
environment variables.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-05 18:21  pgrayson       New Issue                                    
03-15-05 18:21  pgrayson       File Added: buildroot-bb-uclibc-config.patch     
              
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
01-25-06 05:50  prpplague      Status                   assigned => closed  
01-25-06 05:50  prpplague      Resolution               open => won't fix   
01-25-06 05:50  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
