From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:01:35 +0200
Subject: [Buildroot] [git commit] package/libnl: bump version to 3.5.0
Message-ID: <20191007210252.20DD58B340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bd06e86195b97a6a3a59e446a2caa23ec97f23f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnl/libnl.hash | 6 ++++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index b9c626043d..d7cd5c9532 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,6 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_4_0/libnl-3.4.0.tar.gz.sha256sum
-sha256	b7287637ae71c6db6f89e1422c995f0407ff2fe50cecd61a312b6a9b0921f5bf	libnl-3.4.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.md5sum
+md5 74ba57b1b1d6f9f92268aa8141d8e8e4  libnl-3.5.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.sha256sum
+sha256 352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa  libnl-3.5.0.tar.gz
 # Locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 397910c4a7..795dfc2316 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.4.0
+LIBNL_VERSION = 3.5.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
