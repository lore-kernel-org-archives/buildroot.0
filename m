From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:16 -0800
Subject: [Buildroot] [buildroot 0000966]: [PARTIAL PATCH] Add support for
	dump/restore
Message-ID: <bb62b5f4c0600a56e83074509da4dd3d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=966 
====================================================================== 
Reported By:                redhatter
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   966
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-21-2006 06:32 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    [PARTIAL PATCH] Add support for dump/restore
Description: 
The EXT2/3 file system backup utilities, dump & restore, can be made to
successfully compile against ?Clibc, provided a blank 'fstab.h' file is
inserted into the build_${ARCH}/staging_dir/includes directory in
buildroot.

This patch, is a partial update to dump, with modifications to e2fsprogs,
to allow cross-compilation of dump.
====================================================================== 

---------------------------------------------------------------------- 
 redhatter - 07-21-06 06:34  
---------------------------------------------------------------------- 
Almost forgot the Config.in and dump.mk files. ;-)  Naturally, these go in
the packages/dump/ directory. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-21-06 06:32  redhatter      New Issue                                    
07-21-06 06:32  redhatter      Status                   new => assigned     
07-21-06 06:32  redhatter      Assigned To               => uClibc          
07-21-06 06:32  redhatter      File Added: add-dump.diff                    
07-21-06 06:33  redhatter      File Added: Config.in                        
07-21-06 06:33  redhatter      File Added: dump.mk                          
07-21-06 06:34  redhatter      Note Added: 0001547                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
