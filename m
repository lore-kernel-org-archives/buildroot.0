From: chris at basementcode.com <chris@basementcode.com>
Date: Tue, 22 Mar 2011 09:24:39 -0500
Subject: [Buildroot] problems compiling crosstools-ng
Message-ID: <cd12ab38cf1fa34fa4c10dfaf6eec135@basementcode.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I'm not sure if this belongs in the crosstools mailing list, or the 
 buildroot mailing list, so sorry if this in the wrong place.

 I'm having a fair amount of trouble compiling the crosstools-ng 
 toolchain.

 I just wanted to post the errors that I was unable to get around while 
 compiling with various versions of buildroot.

 buildroot-2010.11:
 m4 gives and error and says "--gnu" is not a valid option.
 I have m4-1.4.15 installed, and the man page says that --gnu is valid.
 Does buildroot have another copy of m4?

 buildroot-2011.02:
 during the configure stage of binutils the configure script spawns the 
 following process over and over until swap is filled and the system 
 crashes:
 makeinfo --force --force --force --force --force --force --force 
 --force --force --force --force  ......
 Same for the latest git version.

 I left the make menuconfig options as default, except to pick an arm 
 target and the crosstools-ng toolchain with glibc.
 I'm running gentoo as a distro.

 If anybody has encountered and solved these problems before, please let 
 me know.

 thanks,

 -Chris
