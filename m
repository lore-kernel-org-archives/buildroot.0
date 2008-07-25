From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Jul 2008 17:02:54 -0700
Subject: [Buildroot] [buildroot 0004014]: Alsa-Lib and Alsa-Utils are not
	the latest versions or using package build system
Message-ID: <3cffc87daa9b02b2b4e2c9fd38efa5bc@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4014 
====================================================================== 
Reported By:                daniellaird
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4014
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-08-2008 06:06 PDT
Last Modified:              07-24-2008 17:02 PDT
====================================================================== 
Summary:                    Alsa-Lib and Alsa-Utils are not the latest versions
or using package build system
Description: 
Alsa-Lib and Alsa-Utils are now much newer (1.0.16).
These patches have modified some patches posted by Matthew Dombroski that
move alsa-lib and alsa-utils to new version and new package build system.
====================================================================== 

---------------------------------------------------------------------- 
 mdombroski - 07-24-08 17:02  
---------------------------------------------------------------------- 
I have uploaded new alsa-utils.mk and alsa-lib.mk.
The --with-versioned=no flag is set by default
-mabi=aapcs-linux is only set for EABI arm targets. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-08-08 06:06  daniellaird    New Issue                                    
07-08-08 06:06  daniellaird    Status                   new => assigned     
07-08-08 06:06  daniellaird    Assigned To               => buildroot       
07-08-08 06:06  daniellaird    File Added: alsa-lib-utils.patch                 
  
07-24-08 17:01  mdombroski     File Added: alsa-lib.mk                      
07-24-08 17:01  mdombroski     File Added: alsa-utils.mk                    
07-24-08 17:02  mdombroski     Note Added: 0009974                          
======================================================================
