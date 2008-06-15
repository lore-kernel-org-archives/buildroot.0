From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Jun 2008 03:58:29 -0700
Subject: [Buildroot] [buildroot 0003774]: valgrind doesn't build for powerpc
	target
Message-ID: <972340b1b0ec0399d97397c98e7ede99@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3774 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3774
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-15-2008 03:58 PDT
Last Modified:              06-15-2008 03:58 PDT
====================================================================== 
Summary:                    valgrind doesn't build for powerpc target
Description: 
then mv -f ".deps/libcoregrind_ppc32_linux_a-readstabs.Tpo"
".deps/libcoregrind_ppc32_linux_a-readstabs.Po"; else rm -f
".deps/libcoregrind_ppc32_linux_a-readstabs.Tpo"; exit 1; fi
In file included from m_debuginfo/readstabs.c:46:
/home/test/build-area/buildroot/buildroot/build_powerpc/staging_dir/usr/include/a.out.h:4:26:
error: linux/a.out.h: No such file or directory
m_debuginfo/readstabs.c: In function
'vgModuleLocal_read_debuginfo_stabs':
m_debuginfo/readstabs.c:123: error: invalid application of 'sizeof' to
incomplete type 'struct nlist'
m_debuginfo/readstabs.c:123: warning: division by zero
m_debuginfo/readstabs.c:126: error: invalid use of undefined type 'struct
nlist'
m_debuginfo/readstabs.c:126: error: dereferencing pointer to incomplete
type
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-15-08 03:58  fabo           New Issue                                    
06-15-08 03:58  fabo           Status                   new => assigned     
06-15-08 03:58  fabo           Assigned To               => buildroot       
======================================================================
