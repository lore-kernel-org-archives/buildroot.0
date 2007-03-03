From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 3 Mar 2007 11:47:53 -0800
Subject: [Buildroot] [buildroot 0001255]: mpfr compilation fails on OS X
Message-ID: <b15c61f958801488ea3dd6f4f534e673@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1255 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1255
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-03-2007 11:47 PST
Last Modified:              03-03-2007 11:47 PST
====================================================================== 
Summary:                    mpfr compilation fails on OS X
Description: 
On OS X, mpfr fails to compile with the following linker error:
ld: common symbols not allowed with MH_DYLIB output format with the
-multi_module option
This seems to be gmp's fault and can be fixed with the attached patch.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-03-07 11:47  holin          New Issue                                    
03-03-07 11:47  holin          Status                   new => assigned     
03-03-07 11:47  holin          Assigned To               => buildroot       
03-03-07 11:47  holin          File Added: buildroot-070303-gmp-osxbuild.patch  
                 
======================================================================
