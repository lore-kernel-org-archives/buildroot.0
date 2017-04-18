From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 18 Apr 2017 09:29:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.17
Message-ID: <20170418072946.4093-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 8 ++++++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 1e79a4ff1..2bd7a8d52 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,6 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.16.tar.xz.sha256
-sha256 4caecd8d246265db4e4d37df0901e396accd84de060525dda8212935cd2ee285  freeswitch-1.6.16.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.md5
+md5 b50939fe562c66ca799f7a7f0e341488  freeswitch-1.6.17.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.sha1
+sha1 feda8e9334410bee1e5ae4d959a0982cf18c5bee  freeswitch-1.6.17.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.sha256
+sha256 709b3e43362d86b9682a7db14eb344b74362493d68244dfc4e6f40218089d4e1  freeswitch-1.6.17.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index b75cdab67..e6c1e8c93 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.16
+FREESWITCH_VERSION = 1.6.17
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPL-1.1, \
-- 
2.11.0
