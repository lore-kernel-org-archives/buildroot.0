From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Dec 2007 06:35:59 -0800
Subject: [Buildroot] [buildroot 0001719]: Use absolute path for toolchain
	external path
Message-ID: <24fd24e4e7011c4b6373511c1516d6e9@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1719 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1719
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2007 06:35 PST
Last Modified:              12-12-2007 06:35 PST
====================================================================== 
Summary:                    Use absolute path for toolchain external path
Description: 
The BR2_TOOLCHAIN_EXTERNAL_PATH config value may be relative to the
buildroot directory (e.g. "../ext-toolchain").

Since packages are often built after cd'ing to their directory, we better
use absolute paths to refer to the toolchain. This patch ensures that.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-07 06:35  ikonst         New Issue                                    
12-12-07 06:35  ikonst         Status                   new => assigned     
12-12-07 06:35  ikonst         Assigned To               => buildroot       
12-12-07 06:35  ikonst         File Added: toolchain_external_path_abs.patch    
               
======================================================================
