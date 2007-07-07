From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 11:57:30 -0700
Subject: [Buildroot] [buildroot 0001419]: DEPRECATED: Selecting 2.6.19.2 as
	kernel header source should pull from www.kernel.org
Message-ID: <404cac95d4fea7e403899ccfca11abe7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been UPDATED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1419 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1419
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-03-2007 07:02 PDT
Last Modified:              07-07-2007 11:57 PDT
====================================================================== 
Summary:                    DEPRECATED: Selecting 2.6.19.2 as kernel header
source should pull from www.kernel.org
Description: 
If the following options are selected, then the build does not pull from
kernel.org.

BR2_DEPRECATED=y
BR2_KERNEL_HEADERS_2_6_19_2=y

Attached is a patch to update 2.6.19.2 in the
toolchain/kernel-headers/kernel-headers-new.makefile to correctly download
that release for use as headers and a build kernel.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-03-07 07:02  bjdooks        New Issue                                    
07-03-07 07:02  bjdooks        Status                   new => assigned     
07-03-07 07:02  bjdooks        Assigned To               => buildroot       
07-03-07 07:02  bjdooks        File Added: patch-add-2619-2-to-new-headers.patch
                   
07-07-07 11:57  bernhardf      Summary                  Selecting 2.6.19.2 as
kernel header source should pull from www.kernel.org => DEPRECATED: Selecting
2.6.19.2 as kernel header source should pull from www.kernel.org
======================================================================
