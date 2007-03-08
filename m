From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Mar 2007 02:53:11 -0800
Subject: [Buildroot] [buildroot 0001266]: jpeg package won't build shared
	libraries on non-Linux hosts
Message-ID: <e5cc65ef4d35dd1b6a638a817dbb9199@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1266 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1266
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-08-2007 02:53 PST
Last Modified:              03-08-2007 02:53 PST
====================================================================== 
Summary:                    jpeg package won't build shared libraries on
non-Linux hosts
Description: 
Shared library detection fails in ltconfig because it autodetects the host.
However, host is specified on command-line to configure, but not propagated
to ltconfig. Attached a patch to fix that.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-08-07 02:53  holin          New Issue                                    
03-08-07 02:53  holin          Status                   new => assigned     
03-08-07 02:53  holin          Assigned To               => buildroot       
03-08-07 02:53  holin          File Added: buildroot-070308-jpeg-ltconfig.patch 
                  
======================================================================
