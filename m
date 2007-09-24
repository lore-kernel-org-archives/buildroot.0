From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 00:58:16 -0700
Subject: [Buildroot] [buildroot 0001133]: build fails if 'UCLIBC_BUILD_SSP'
	is enabled
Message-ID: <27e8432c74b50188190072812fe5711f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1133 
====================================================================== 
Reported By:                frank sabella
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1133
Category:                   Security
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-26-2006 15:06 PST
Last Modified:              09-24-2007 00:58 PDT
====================================================================== 
Summary:                    build fails if 'UCLIBC_BUILD_SSP' is enabled
Description: 
Host: x86
Target: x86
buildroot svn: 17052
uClibc svn: 17064
gcc-4.1.1
binutils-2.17

Buildroot fails when compiling uClibc with 'UCLIBC_BUILD_SSP' enabled.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 00:58  
---------------------------------------------------------------------- 
This is supposed to work with uclibc-0.9.29 and current buildroot (with a
current toolchain). Please retest. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-26-06 15:06  frank sabella  New Issue                                    
12-26-06 15:06  frank sabella  Status                   new => assigned     
12-26-06 15:06  frank sabella  Assigned To               => uClibc          
12-26-06 15:07  frank sabella  Issue Monitored: frank sabella                   

02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
09-24-07 00:58  bernhardf      Note Added: 0002781                          
======================================================================
