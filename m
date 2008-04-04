From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Apr 2008 05:46:32 -0700
Subject: [Buildroot] [buildroot 0002824]: gdb 6.7.1 patches don't apply
Message-ID: <0decb4f3cf7b8c32f35d20c5a41748d6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2824 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2824
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-04-2008 05:46 PDT
Last Modified:              04-04-2008 05:46 PDT
====================================================================== 
Summary:                    gdb 6.7.1 patches don't apply
Description: 
Hi,

gdb 6.7.1 patches don't apply.

Quick and easy way to reproduce:
1) make menuconfig
2) select gdb version 6.7.1 or snapshot
3) save and exit
4) make gdbserver

[off-topic] gdb 6.8 was released.

cheers,

Fathi

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-04-08 05:46  fabo           New Issue                                    
04-04-08 05:46  fabo           Status                   new => assigned     
04-04-08 05:46  fabo           Assigned To               => buildroot       
======================================================================
