From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 01 Dec 2009 15:42:13 +0100
Subject: [Buildroot] Buildroot 2009.11 released
Message-ID: <87bpiilpru.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2009.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2009.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2009.11.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

- Simplified / cleaned up output directories, thanks to Thomas Petazzoni
- Sane clean/distclean make targets
- Defconfigs are now located in configs/ for easy browsing like
  U-Boot / the Linux kernel
- Support for the ARM cortex A8 architecture and GCC 4.4.2 support
- New packages: divine, gvfs, libarchive, libmicrohttpd, sdl_sound,
  swfdec and sysstat
- A bunch of more packages are converted into Makefile.autotools.in
  format, bringing cleanups and fixes various build issues.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11

The next release is going to be 2010.02. Expect the first release
candidate in late January and the final release at the end of
February. The regression test suite, mentioned in the 2009.08 release
notes didn't materialize yet, but the new rand/allyes/allnopackageconfig
make targets will make it easier to implement, and hopefully we will
have it running by 2010.02.

Other stuff in the pipeline includes:

 - Better external toolchain support and closer cooporation with
   crosstool-ng (http://ymorin.is-a-geek.org/projects/crosstool)
 - Generalized package infrastructure (host/non-autotools):
   http://lists.busybox.net/pipermail/buildroot/2009-November/030600.html

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
