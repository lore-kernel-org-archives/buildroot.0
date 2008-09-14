From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 13 Sep 2008 20:50:47 -0700
Subject: [Buildroot] [buildroot 0004954]: Cannot build gcc-4.3.2 under a
	buildroot rootfs
Message-ID: <baaa386595ac861f9621b4078a1f4015@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4954 
====================================================================== 
Reported By:                jbruchon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4954
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-13-2008 20:50 PDT
Last Modified:              09-13-2008 20:50 PDT
====================================================================== 
Summary:                    Cannot build gcc-4.3.2 under a buildroot rootfs
Description: 
I have been unable to build gcc under any buildroot-generated rootfs for
many months now.  I mimic most of the options listed under "gcc -v" and I
manually made the symlink /lib/cpp -> /usr/bin/cpp to correct an error,
but for some reason there are complaints about GNU header files in
config.log and I am unable to build gcc at all.  This is using the latest
snapshot of buildroot and the latest snapshot of uClibc, along with most
of the programs under "Generic development system."  I have stuck with
defaults throughout the entire process to attempt to minimize the
possibility of this happening; no matter how I change the buildroot,
uClibc, or gcc configuration, I am NEVER EVER able to compile gcc-4.3.x
under ANY buildroot rootfs whatsoever.

In short, a buildroot rootfs can't self-host!
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-13-08 20:50  jbruchon       New Issue                                    
09-13-08 20:50  jbruchon       Status                   new => assigned     
09-13-08 20:50  jbruchon       Assigned To               => buildroot       
09-13-08 20:50  jbruchon       File Added: config.log                       
======================================================================
