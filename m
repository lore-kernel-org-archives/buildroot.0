From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Feb 2007 00:48:04 -0800
Subject: [Buildroot] [buildroot 0001234]: Allow common configuration options
	to be specified in one place
Message-ID: <aa396c1a35f794d4477291fcbdec00e8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              02-20-2007 00:48 PST
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

---------------------------------------------------------------------- 
 djl197 - 02-20-07 00:48  
---------------------------------------------------------------------- 
Updated patch as first one had a trailing \ missing !!!! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-07 07:15  djl197         New Issue                                    
02-19-07 07:15  djl197         Status                   new => assigned     
02-19-07 07:15  djl197         Assigned To               => buildroot       
02-19-07 07:15  djl197         File Added: buildroot_common_config_opts.patch   
                
02-20-07 00:47  djl197         File Added: buildroot_common_config_opts_2.patch 
                  
02-20-07 00:48  djl197         Note Added: 0002183                          
======================================================================
