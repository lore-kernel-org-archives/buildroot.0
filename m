From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:28 -0800
Subject: [Buildroot] [buildroot 0000806]: arm-linux-uclibc-gcc: command not
	found while executing make
Message-ID: <b87fa0609189edd14756771f49cb7032@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=806 
====================================================================== 
Reported By:                aroman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   806
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-29-2006 03:54 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    arm-linux-uclibc-gcc: command not found while
executing make
Description: 
I am using the latest SVN snapshot. I executed make menuconfig, then make.
I have attached the log of my problem. Basically, the gcc compiler does
not get downloaded, thus I cannot build anything.

If it helps, my make version is 3.80.
====================================================================== 

---------------------------------------------------------------------- 
 aroman - 03-29-06 03:55  
---------------------------------------------------------------------- 
I have also uploaded my .config file. 

---------------------------------------------------------------------- 
 vapier - 03-29-06 11:02  
---------------------------------------------------------------------- 
dont select nptl for threading 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-29-06 03:54  aroman         New Issue                                    
03-29-06 03:54  aroman         Status                   new => assigned     
03-29-06 03:54  aroman         Assigned To               => uClibc          
03-29-06 03:54  aroman         File Added: uclibc-make.log                    
03-29-06 03:55  aroman         File Added: .config                          
03-29-06 03:55  aroman         Note Added: 0001203                          
03-29-06 11:02  vapier         Note Added: 0001204                          
03-29-06 11:02  vapier         Status                   assigned => closed  
03-29-06 11:02  vapier         Resolution               open => won't fix   
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
