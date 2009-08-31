From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 Aug 2009 17:42:49 +0200
Subject: [Buildroot] Buildroot 2009.08 released
Message-ID: <87hbvoq9ae.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2009.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2009.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2009.08.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

- Improvements to the external toolchain support, including glibc
  support
- Support for the Xtensa architecture
- QT based configurator (make xconfig)
- Cleanups to X.org handling
- New packages: bmon, ctorrent, dosfstools, enchant, gst-plugins-bad,
  iw, libmms, libnl, libuuid, netstat-nat, ntfsprogs, sdl_gfx and
  spawn-fcgi
- A bunch of more packages are converted into Makefile.autotools.in
  format, bringing cleanups and fixes various build issues.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08

The next release is going to be 2009.11. Expect the first release
candidate in late October and the final release at the end of
November. One of the issues I will be working on in the new development
phase is a proper regression test suite, most likely using Buildbot.

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
