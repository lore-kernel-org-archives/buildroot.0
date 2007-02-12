From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:56 -0800
Subject: [Buildroot] [buildroot 0000311]: Weird OpenSSL Installation of
	buildroot.
Message-ID: <f12b80e18b584e44dc8df59f3f95a165@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=311 
====================================================================== 
Reported By:                edmondd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   311
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-27-2005 03:01 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Weird OpenSSL Installation of buildroot.
Description: 
Only the libraries of OpenSSL is install on the filesystem. 
The binaries and configuration files are missing. Is this normal?

Please check line 41 of buildroot/package/openssl/openssl.mk.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 09:00  
---------------------------------------------------------------------- 
I don't see any obvious errors with current svn and openSSL. Closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-27-05 03:01  edmondd        New Issue                                    
06-27-05 03:06  edmondd        Issue Monitored: edmondd                     
11-28-06 09:00  bernhardf      Status                   assigned => closed  
11-28-06 09:00  bernhardf      Note Added: 0001828                          
11-28-06 09:00  bernhardf      Resolution               open => no change
required
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
