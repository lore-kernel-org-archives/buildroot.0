From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 19 Feb 2007 07:15:01 -0800
Subject: [Buildroot] [buildroot 0001234]: Allow common configuration options
	to be specified in one place
Message-ID: <0bc2986f15fcfbc732462c1d4be93143@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1234 
====================================================================== 
Reported By:                djl197
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1234
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-19-2007 07:15 PST
Last Modified:              02-19-2007 07:15 PST
====================================================================== 
Summary:                    Allow common configuration options to be specified
in one place
Description: 
This change allows users to use menuconfig to select Static or Shared
package builds (or both).
At the same time it allows a set of common configure options to be
specified.
(TARGET_CONFIGURE_FLAGS).
These flags specify common flags based upon which packages are specified. 
For instance enabling LIBJPEG will pass --enable-libjpeg and
--enable-jpeg=yes to configure.
The package makefiles will need to be modified to start using this
variable and that is not done in this patch. I hope people will start to
use this variable.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-07 07:15  djl197         New Issue                                    
02-19-07 07:15  djl197         Status                   new => assigned     
02-19-07 07:15  djl197         Assigned To               => buildroot       
02-19-07 07:15  djl197         File Added: buildroot_common_config_opts.patch   
                
======================================================================
