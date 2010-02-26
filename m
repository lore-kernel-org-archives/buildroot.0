From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 09:14:30 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0f40a46a54a3620c88fbd52e38a0f29c6aedb9a0:
  Gustavo Zacarias (1):
        Remove obsolete hostap package

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes

Thomas Petazzoni (6):
      avahi: add dependency on host-intltool
      libcgicc: fix build breakage and bump version
      libraw1394: fix tarball URL
      cramfs: add CFLAGS/LDFLAGS and host-zlib dependency
      squashfs: pass CFLAGS/LDFLAGS and add host-zlib dependency
      busybox: add upstream 1.16 fix

 package/avahi/avahi.mk                             |    2 +-
 package/busybox/busybox-1.16.0-fsync.patch         |   13 ++++
 package/libcgicc/cgicc-3.2.7-memset.patch          |   12 ----
 .../cgicc-3.2.9-disable-documentation-option.patch |   50 +++++++++++++++
 package/libcgicc/libcgicc.mk                       |    8 ++-
 package/libraw1394/libraw1394.mk                   |    2 +-
 target/cramfs/cramfs.mk                            |    4 +-
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   65 ++++++++++++++++++++
 target/squashfs/squashfsroot.mk                    |    4 +-
 9 files changed, 139 insertions(+), 21 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-fsync.patch
 delete mode 100644 package/libcgicc/cgicc-3.2.7-memset.patch
 create mode 100644 package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch
 create mode 100644 target/squashfs/squashfs-4.0-build-system-fix.patch

Thanks,
-- 
Thomas Petazzoni
