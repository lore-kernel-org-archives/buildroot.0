From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:10 -0800
Subject: [Buildroot] [buildroot 0000772]: udev creates wrong permissions on
	/dev/s3c2410_serial devices
Message-ID: <95c512736a0bf18cbc73ce7b04019f11@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=772 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   772
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-06-2006 02:36 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    udev creates wrong permissions on
/dev/s3c2410_serial devices
Description: 
udev creates wrong permissions on /dev/s3c2410_serial devices

Attached patch adds a line for s3c2410_serial with the correct MODE/group

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 11:22  
---------------------------------------------------------------------- 
applied 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-06-06 02:36  bjdooks        New Issue                                    
03-06-06 02:36  bjdooks        Status                   new => assigned     
03-06-06 02:36  bjdooks        Assigned To               => uClibc          
03-06-06 02:36  bjdooks        File Added: buildroot-udev-s3c2410.patch         
          
04-06-06 11:22  andersen       Note Added: 0001235                          
04-06-06 11:22  andersen       Status                   assigned => closed  
04-06-06 11:22  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
