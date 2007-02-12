From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:36 -0800
Subject: [Buildroot] [buildroot 0000069]: Add ability to run 'make
	menuconfig' on uClibc during buildroot
Message-ID: <84ba6d6ac0cdcd8c4ce3425ea164d886@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=69 
====================================================================== 
Reported By:                jswensen
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   69
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-27-2005 10:40 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Add ability to run 'make menuconfig' on uClibc
during buildroot
Description: 
I wanted the ability to run 'make menuconfig' during the uClibc step of the
buildroot process.  I have attached patches that make it a toolchain option
in the buildroot menuconfig.  You may not agree with where the option
should be placed, but I think it should be an option.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-27-05 10:40  jswensen       New Issue                                    
01-27-05 10:40  jswensen       File Added: uclibc_menuconfig.patch              
     
03-16-05 12:15  andersen       Status                   new => assigned     
03-16-05 12:15  andersen       Assigned To               => uClibc          
02-10-06 10:38  prpplague      Status                   assigned => closed  
02-10-06 10:38  prpplague      Resolution               open => won't fix   
02-10-06 10:38  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
