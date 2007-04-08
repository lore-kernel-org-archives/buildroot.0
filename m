From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Apr 2007 01:09:25 -0700
Subject: [Buildroot] [buildroot 0001305]: target "ARM" does not build
Message-ID: <c03c24dc8759d0596c85897d20b7a074@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1305 
====================================================================== 
Reported By:                bell
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1305
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2007 01:09 PDT
Last Modified:              04-08-2007 01:09 PDT
====================================================================== 
Summary:                    target "ARM" does not build
Description: 
Target architecture "arm" with no other changes on default config does not
build:


.debug_varnames
 *(.debug_varnames)

.note.gnu.arm.ident
 *(.note.gnu.arm.ident)

/DISCARD/
 *(.note.GNU-stack)
OUTPUT(busybox_unstripped elf32-littlearm)
collect2: ld returned 1 exit status
/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-strip:
'busybox_unstripped': No such file
install: cannot stat `busybox': No such file or directory
make[1]: *** [install] Fehler 1
make[1]: Leaving directory
`/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/busybox-1.5.0'
make: ***
[/home/anwender/embedded/elta8882a/buildroot/buildroot/build_arm/root/bin/busybox]
Fehler 2



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-07 01:09  bell           New Issue                                    
04-08-07 01:09  bell           Status                   new => assigned     
04-08-07 01:09  bell           Assigned To               => buildroot       
======================================================================
