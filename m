From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Jan 2017 03:46:17 +0000
Subject: [Buildroot] [Bug 9606] New: xorg-server cannot build for ARM target
Message-ID: <bug-9606-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9606

            Bug ID: 9606
           Summary: xorg-server cannot build for ARM target
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: icenowy at aosc.xyz
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6861
  --> https://bugs.busybox.net/attachment.cgi?id=6861&action=edit
Compressed .config file

make[6]: Entering directory
'/home/icenowy/sda9/buildroot/buildroot-2016.11.1/output/build/xserver_xorg-server-1.18.4/hw/xfree86/os-support/linux'
  CC       lnx_init.lo
In file included from lnx_init.c:33:0:
../../../../hw/xfree86/common/compiler.h: In function 'xf_outb':
../../../../hw/xfree86/common/compiler.h:770:5: error: implicit declaration of
function 'outb' [-Werror=implicit-function-declaration]
     outb(val, port);
     ^
../../../../hw/xfree86/common/compiler.h:770:5: warning: nested extern
declaration of 'outb' [-Wnested-externs]
../../../../hw/xfree86/common/compiler.h: In function 'xf_outw':
../../../../hw/xfree86/common/compiler.h:776:5: error: implicit declaration of
function 'outw' [-Werror=implicit-function-declaration]
     outw(val, port);
     ^
../../../../hw/xfree86/common/compiler.h:776:5: warning: nested extern
declaration of 'outw' [-Wnested-externs]
../../../../hw/xfree86/common/compiler.h: In function 'xf_outl':
../../../../hw/xfree86/common/compiler.h:782:5: error: implicit declaration of
function 'outl' [-Werror=implicit-function-declaration]
     outl(val, port);
     ^
../../../../hw/xfree86/common/compiler.h:782:5: warning: nested extern
declaration of 'outl' [-Wnested-externs]
cc1: some warnings being treated as errors

-- 
You are receiving this mail because:
You are on the CC list for the bug.
