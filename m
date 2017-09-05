From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:13:20 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.27.2
Message-ID: <20170905190627.1A5C280402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cdb463e442d63f0ba361e7348d0ed56cb9b63d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.hash | 6 +++---
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index c0688ff..14d7d1c 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.27.1.tar.bz2.sign
-md5	df7e45d07634c54ca16b9191635db9c6	busybox-1.27.1.tar.bz2
-sha1	a154f70a10fe39062b6fb00eaff5baf39db535ec	busybox-1.27.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.27.2.tar.bz2.sign
+md5	476186f4bab81781dab2369bfd42734e	busybox-1.27.2.tar.bz2
+sha1	11669e223cc38de646ce26080e91ca29b8d42ad9	busybox-1.27.2.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3807383..1aeeeef 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.27.1
+BUSYBOX_VERSION = 1.27.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
