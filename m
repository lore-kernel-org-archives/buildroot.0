From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Jun 2009 11:26:05 +0200
Subject: [Buildroot] [git commit] busybox: bump 1.14.x version
Message-ID: <20090624092656.DB08A77802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e616c68acc2fff72d5ab1bbf90b5736d61f2e40e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is too large, so refusing to show it


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                     |    2 +-
 package/busybox/busybox-1.14.1-ash.patch      |   13 -
 package/busybox/busybox-1.14.1-ftpd.patch     |   22 -
 package/busybox/busybox-1.14.1-httpd.patch    |  655 -------------------------
 package/busybox/busybox-1.14.1-modprobe.patch |  132 -----
 package/busybox/busybox-1.14.1-readlink.patch |   88 ----
 package/busybox/busybox-1.14.1-telnetd.patch  |   85 ----
 7 files changed, 1 insertions(+), 996 deletions(-)
 delete mode 100644 package/busybox/busybox-1.14.1-ash.patch
 delete mode 100644 package/busybox/busybox-1.14.1-ftpd.patch
 delete mode 100644 package/busybox/busybox-1.14.1-httpd.patch
 delete mode 100644 package/busybox/busybox-1.14.1-modprobe.patch
 delete mode 100644 package/busybox/busybox-1.14.1-readlink.patch
 delete mode 100644 package/busybox/busybox-1.14.1-telnetd.patch
