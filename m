From: James L Henrickson <jim.henrickson@critical.com>
Date: Thu, 01 Feb 2007 01:17:27 -0500
Subject: [Buildroot] working .config for nios2?
Message-ID: <45C185F7.5080406@critical.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After a lot of experimenting, I managed to generate .config files that 
resulted in the successful build of i586 and i486 targets (including the 
linux kernel).  Now I seem to be stuck trying to build for a nios2 
target.  If I try using the uclibc snapshot, it gets stuck trying to 
build for the various elf, flat, etc options  (all four options fail).  
If I try using an earlier version of uclibc, it tries to use 
nios2-elf-gcc (which doesn't exist) instead of nios2-linux-uclibc-gcc 
(which does exist).  I tried using various versions of gcc and both of 
the supported 2.6.x kernel versions.  I also tried both a few-days-old 
version of BuildRoot and the latest snapshot, with those various 
permutations of config items.  I'm running out of ideas.  Does anyone 
have a working .config for nios2?

Jim Henrickson
