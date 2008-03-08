From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 8 Mar 2008 04:29:56 -0800
Subject: [Buildroot] [buildroot 0002494]: Attempt to build usb tools fails
	by missing libusb.so
Message-ID: <86547a590dae694142a3e2e367d3510e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2494 
====================================================================== 
Reported By:                ucdamiano
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2494
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-08-2008 04:29 PST
Last Modified:              03-08-2008 04:29 PST
====================================================================== 
Summary:                    Attempt to build usb tools fails by missing
libusb.so
Description: 
I try to build USB libraries packages on ARM S3C2410, the vanilla
compilation is OK and the generated systems works (only using OABi, but it
works) but when I try to add support for USB I get the following error (see
additional information)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-08-08 04:29  ucdamiano      New Issue                                    
03-08-08 04:29  ucdamiano      Status                   new => assigned     
03-08-08 04:29  ucdamiano      Assigned To               => buildroot       
======================================================================
