From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Apr 2018 11:54:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch-mod-bcg729: bump version
 to v1.0.4
Message-ID: <20180428095440.16090-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash | 2 +-
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
index 67804883bc..475556ebe9 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 135f545ad0eef49d1228f8d66a4e66f1ff5f1f8fdf115e88c1df3df8df49fdcb  freeswitch-mod-bcg729-c504eea91f225014380ae17c00b35e7173e316ad.tar.gz
+sha256 0dec5b78f655e175936806396b89b4997c8e543a1c84683a19ea2b6f36e01d7e  freeswitch-mod-bcg729-v1.0.4.tar.gz
 sha256 bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
index 15f9375f2b..98324b2a08 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_MOD_BCG729_VERSION = c504eea91f225014380ae17c00b35e7173e316ad
+FREESWITCH_MOD_BCG729_VERSION = v1.0.4
 FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,$(FREESWITCH_MOD_BCG729_VERSION))
 FREESWITCH_MOD_BCG729_LICENSE = MPL-1.1
 FREESWITCH_MOD_BCG729_LICENSE_FILES = LICENSE
-- 
2.14.2
