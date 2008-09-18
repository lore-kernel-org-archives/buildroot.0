From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 18 Sep 2008 05:20:12 -0700
Subject: [Buildroot] [buildroot 0005074]: libpcap 0.9.5 no longaer available
Message-ID: <5d974f7b02a58b4466e14ee4f4ccbf98@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5074 
====================================================================== 
Reported By:                zonque
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5074
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-18-2008 05:20 PDT
Last Modified:              09-18-2008 05:20 PDT
====================================================================== 
Summary:                    libpcap 0.9.5 no longaer available
Description: 
libpcap 0.9.5 is no longer available. this patch moves to 0.9.8 and also
adopts the included patch file.
it also ships around the ugly fact that libpcap is shipped with .rej and
.orig files in its tarball which the patch-kernel script can't find funny.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-18-08 05:20  zonque         New Issue                                    
09-18-08 05:20  zonque         Status                   new => assigned     
09-18-08 05:20  zonque         Assigned To               => buildroot       
09-18-08 05:20  zonque         File Added: libpcap-0.9.8.diff                   

======================================================================
