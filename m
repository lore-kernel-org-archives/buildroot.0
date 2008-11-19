From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Nov 2008 08:06:30 -0800
Subject: [Buildroot] [buildroot 0006404]: master buildroot .config doesn't
	honor BR2_PACKAGE_LINUX_KCONFIG
Message-ID: <333a99266a7b0b9aeb3ef3e4db5596e7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6404 
====================================================================== 
Reported By:                suffecool
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6404
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-19-2008 08:06 PST
Last Modified:              11-19-2008 08:06 PST
====================================================================== 
Summary:                    master buildroot .config doesn't honor
BR2_PACKAGE_LINUX_KCONFIG
Description: 
I have my four config files saved in ./local/samdev.
I type "make BOARD=samdev getconfig", which copies
./local/samdev/samdev.config to .config.
Within this .config file are these pertinent defined variables:

BR2_UCLIBC_CONFIG="./local/samdev/uclibc-0.9.29.config
BR2_PACKAGE_BUSYBOX_CONFIG="./local/samdev/busybox-1.12.1.config
BR2_PACKAGE_LINUX_KCONFIG="./local/samdev/linux-2.6.27.config"
BR2_PACKAGE_LINUX_USE_KCONFIG=y

Although buildroot is indeed honoring the UCLIBC and BUSYBOX config
directives, it is ignoring the one for the linux kernel.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-19-08 08:06  suffecool      New Issue                                    
11-19-08 08:06  suffecool      Status                   new => assigned     
11-19-08 08:06  suffecool      Assigned To               => buildroot       
======================================================================
