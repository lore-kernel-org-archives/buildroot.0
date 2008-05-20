From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 May 2008 02:42:51 -0700
Subject: [Buildroot] [buildroot 0003374]: download path for
	lockfile-progs_0.1.11.tar.gz invalid
Message-ID: <403abc707a9e00fd21dc119626f2ac57@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3374 
====================================================================== 
Reported By:                sgleissner
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3374
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-20-2008 02:42 PDT
Last Modified:              05-20-2008 02:42 PDT
====================================================================== 
Summary:                    download path for lockfile-progs_0.1.11.tar.gz
invalid
Description: 
(buildroot version 20080519)

When running "make" for buildroot, the make process can not download the
file lockfile-progs_0.1.11.tar.gz from
http://ftp.debian.org/debian/pool/main/l/lockfile-progs/lockfile-progs_0.1.11.tar.gz
and the build process stops. On the debian server, the file is no longer
available.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-20-08 02:42  sgleissner     New Issue                                    
05-20-08 02:42  sgleissner     Status                   new => assigned     
05-20-08 02:42  sgleissner     Assigned To               => buildroot       
======================================================================
