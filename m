From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 29 Mar 2007 02:47:46 -0700
Subject: [Buildroot] [buildroot 0001295]: GumStix Buildroot on VMWare Fedora
	Core 6
Message-ID: <bfc92fe1243762b520fda1eb618c01bb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1295 
====================================================================== 
Reported By:                nehalsh
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1295
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-29-2007 02:47 PDT
Last Modified:              03-29-2007 02:47 PDT
====================================================================== 
Summary:                    GumStix Buildroot on VMWare Fedora Core 6
Description: 
I am using Fedoracore 6 on VMware ...Trying to build toolchain for GumStix
boards. I tried with gcc 4.1.1 and Binutils 2.16.x and make gives an error
of unrecognized emulation mode : armelf_linux_eabi
supported mode : linux_armelf armelf

Then i chnage gcc version 3.4.5 but in that case created output files give
EABI version mismatch error.

Rest of settings are default one
Any one who tried this compilation with above mentioned combination ?


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-29-07 02:47  nehalsh        New Issue                                    
03-29-07 02:47  nehalsh        Status                   new => assigned     
03-29-07 02:47  nehalsh        Assigned To               => buildroot       
======================================================================
