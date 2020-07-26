From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jul 2020 08:16:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch-mod-bcg729: bump version
 to 1.0.5
Message-ID: <20200726061601.365706-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash | 4 ++--
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
index a863dbfcf7..d7fb58fb6d 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0dec5b78f655e175936806396b89b4997c8e543a1c84683a19ea2b6f36e01d7e  freeswitch-mod-bcg729-1.0.4.tar.gz
-sha256 bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
+sha256  ada0640094b5b3b4a767ec360213bfed624e698c9932b2f9ceb76eb1c0f5a246  freeswitch-mod-bcg729-1.0.5.tar.gz
+sha256  bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
index f92a490051..d820756c0f 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_MOD_BCG729_VERSION = 1.0.4
+FREESWITCH_MOD_BCG729_VERSION = 1.0.5
 FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,v$(FREESWITCH_MOD_BCG729_VERSION))
 FREESWITCH_MOD_BCG729_LICENSE = MPL-1.1
 FREESWITCH_MOD_BCG729_LICENSE_FILES = LICENSE
-- 
2.27.0
