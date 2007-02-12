From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:04 -0800
Subject: [Buildroot] [buildroot 0000463]: [New package] lcdproc - interface
	to a lot of LCD displays
Message-ID: <9af88d172dd3dd4e978a13117423fd74@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=463 
====================================================================== 
Reported By:                dinkel
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   463
Category:                   New Features
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2005 16:25 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    [New package] lcdproc - interface to a lot of LCD
displays
Description: 
The attached patch adds the lcdproc package to the buildroot system.

In the configuration menu 'make menuconfig' you can choose what drivers
should be compiled in LCDd. The 'svgalib' driver is currently not
supported because of a lack of SVGALib in buildroot. The package is tested
to compile every other driver. but only the HD44780 driver is tested to
work correctly.

The diff was done against svn revision 11731!
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-05 16:25  dinkel         New Issue                                    
10-03-05 16:25  dinkel         Status                   new => assigned     
10-03-05 16:25  dinkel         Assigned To               => uClibc          
10-03-05 16:25  dinkel         File Added: buildroot-lcdproc.patch              
     
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
