From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:49 -0800
Subject: [Buildroot] [buildroot 0000834]: libusb: build fix: set big/little
	endian
Message-ID: <3df2f62170227ad7e884a7f16f067675@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=834 
====================================================================== 
Reported By:                jacmet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   834
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-12-2006 02:37 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    libusb: build fix: set big/little endian
Description: 
The following patch fixes a compilation error in libusb (cannot detectect
endian while cross compiling)
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-14-06 11:32  
---------------------------------------------------------------------- 
applied 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-12-06 02:37  jacmet         New Issue                                    
04-12-06 02:37  jacmet         Status                   new => assigned     
04-12-06 02:37  jacmet         Assigned To               => uClibc          
04-12-06 02:37  jacmet         File Added: libusb-endian.patch                  
 
04-14-06 11:32  andersen       Note Added: 0001290                          
04-14-06 11:32  andersen       Status                   assigned => closed  
04-14-06 11:32  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
