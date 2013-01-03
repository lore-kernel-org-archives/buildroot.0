From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 03 Jan 2013 21:58:10 +0100
Subject: [Buildroot] Buildroot 2012.11.1 released
Message-ID: <87obh6nfvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2012.11.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.11.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2012.11.1 is a bugfix release, fixing critical issues
discovered since the 2012.11 release - Most importantly with
non-largefile builds on recent Ubuntu releases.

See the changes file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11.1

Many thanks to all the people contributing to this release:

Chris Zankel (1):
      xtensa: add -mlongcalls to CFLAGS for xtensa

Frank Hunleth (1):
      qt: fix qconfig configure parameter

Mikhail Boiko (1):
      dosfstools: fix download link

Peter Korsgaard (2):
      toolchain/gcc: also disable largefile for pass 1/2 if needed
      Update for 2012.11.1

Richard Braun (1):
      arch: fix BR2_ARCH for generic target variant

-- 
Bye, Peter Korsgaard
