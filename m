From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 22:29:22 +0200
Subject: [Buildroot] [git commit] package/enlightenment: bump to 0.21.10
Message-ID: <20171007202202.C478581130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ba7bfb68cd2d20ea5ffe8f1eb3f5d840bf08104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.enlightenment.org/news/e0.21.10_release

Add COPYING file hash

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.hash | 5 +++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 91fb98a..6fb29a2 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,3 @@
-# From https://www.enlightenment.org/news/e0.21.9_release
-sha256	eb560c0027378baf650d0690747ef0d08b5b329504e26e2210cc7978c019ae70 	enlightenment-0.21.9.tar.xz
+# From https://www.enlightenment.org/news/e0.21.10_release
+sha256	9bb915caa5b390b2e212ff5f6f75b57a3d082f80d2f7b5b278bd902e2fad7f14	enlightenment-0.21.10.tar.xz
+sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 441f049..1c88c8b 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.9
+ENLIGHTENMENT_VERSION = 0.21.10
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
