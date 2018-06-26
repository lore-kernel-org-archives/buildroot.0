From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 22:05:01 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump to 1.14.1
Message-ID: <20180626211527.3739A82DDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eba2622fa4259b7afa3be37d7dd5cc401dcf6f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 5 +++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f8af907562..7e75489337 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.4.tar.xz.sha256sum
-sha256 5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674 gstreamer-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.1.tar.xz.sha256sum
+sha256 28d82b0d261544a9bf85b429399929e4986eb00efcf1ce16cc71d269a4c3186c gstreamer-1.14.1.tar.xz
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index ea9f29a4f3..02158f5238 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.4
+GSTREAMER1_VERSION = 1.14.1
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
