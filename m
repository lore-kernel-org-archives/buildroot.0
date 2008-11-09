From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 9 Nov 2008 03:06:47 -0800
Subject: [Buildroot] [buildroot 0006044]: "make BOARD=$PROJECT getconfig"
	fails at the beginning
Message-ID: <0b4ddd42e0d4c9d1105fe22408651a43@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6044 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6044
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-09-2008 03:06 PST
Last Modified:              11-09-2008 03:06 PST
====================================================================== 
Summary:                    "make BOARD=$PROJECT getconfig" fails at the
beginning
Description: 
At the beginning the "make BOARD=$PROJECT getconfig" fails

$ svn -r$N co $REPOSITORY
$ tar xzf local.tgz -C buildroot
$ cd buildroot
$ make BOARD=$PROJECT getconfig
Makefile:235: .config.cmd: No such file or directory
make: *** No rule to make target `.config.cmd'.  Stop.
$ make menuconfig
$ make BOARD=$PROJECT getconfig

attached pach resolve the problem
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-09-08 03:06  robang74       New Issue                                    
11-09-08 03:06  robang74       Status                   new => assigned     
11-09-08 03:06  robang74       Assigned To               => buildroot       
11-09-08 03:06  robang74       File Added: make-BOARD-getconfig.patch           
        
======================================================================
