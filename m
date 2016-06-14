From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Jun 2016 19:51:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.9
Message-ID: <1465926673-13472-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 2 +-
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 36bd75e..2fca1d4 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
 # From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.8.tar.xz.sha256
-sha256	a9834667c0afc164631611b4862acd6411e4e6ddb706e4af4b51eab4adbe4fc1	freeswitch-1.6.8.tar.xz
+sha256	aa5f191113be2bd44cb4f2108da3dcc37be3234c6b733896fbff97526ac66451	freeswitch-1.6.9.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index f4a3cc3..65e5266 100644
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
