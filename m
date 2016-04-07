From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Apr 2016 23:49:25 +0200
Subject: [Buildroot] [git commit] evemu: bump version to 2.4.0
Message-ID: <20160407214942.D452A81DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc27df28fdcf5f5635f71544421b8183d629559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for details.

[1] https://lists.freedesktop.org/archives/input-tools/2016-April/001274.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index f7a0cc6..1264bed 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-October/001221.html
-sha256 5b0197735f9effa25563b0412c560354bee34f8263eaddb00dd996e6ff56eb6a evemu-2.3.1.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-April/001274.html
+sha256 0706ea5a830203f9cdb30c0e10c8c41d2427128ba9041543a5ae157fa3b4a30e evemu-2.4.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 2fce723..992a1f7 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.3.1
+EVEMU_VERSION = 2.4.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
