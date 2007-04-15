From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Apr 2007 07:46:44 -0700
Subject: [Buildroot] [buildroot 0001315]: buildroot compilation error in gdb
	for ARM
Message-ID: <e46135a47feb492c84e82eb388c7f070@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1315 
====================================================================== 
Reported By:                Matthias Kaehlcke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1315
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-15-2007 07:46 PDT
Last Modified:              04-15-2007 07:46 PDT
====================================================================== 
Summary:                    buildroot compilation error in gdb for ARM
Description: 
i'm trying to build the current buildroot subversion snapshot for ARM
targets. gcc (v4.1.2) aborts with errors in the file
toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:

buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c: In function
?WMAC?:
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2117: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2133: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c: In function
?WMADD?:
/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2169:
error: invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2177: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2186: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2191: error:
invalid lvalue in assignment

(and more errors of the same type)

the host system is Debian testing with kernel 2.6.20

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-15-07 07:46  Matthias KaehlckeNew Issue                                    
04-15-07 07:46  Matthias KaehlckeStatus                   new => assigned     
04-15-07 07:46  Matthias KaehlckeAssigned To               => buildroot       
======================================================================
