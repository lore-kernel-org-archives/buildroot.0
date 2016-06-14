From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Jun 2016 20:03:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: bump version to 1.6.9
Message-ID: <1465927400-2500-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated hash comment (Baruch)

 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 36bd75e..2041158 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.8.tar.xz.sha256
-sha256	a9834667c0afc164631611b4862acd6411e4e6ddb706e4af4b51eab4adbe4fc1	freeswitch-1.6.8.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.9.tar.xz.sha256
+sha256	aa5f191113be2bd44cb4f2108da3dcc37be3234c6b733896fbff97526ac66451	freeswitch-1.6.9.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index de27612..a05b293 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.8
+FREESWITCH_VERSION = 1.6.9
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
-- 
2.8.1
