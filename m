From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jan 2017 21:38:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.14
Message-ID: <20170112203821.26234-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 76966cf29..6412511d5 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.13.tar.xz.sha256
-sha256 64a8a14fc5df92893d956868f144042891cc3e2d096bbf56241fec706635a8b7  freeswitch-1.6.13.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.14.tar.xz.sha256
+sha256 759cb79800c02b9476fcec4c88822942ed6183d9c2686015e4c293e22790cf35  freeswitch-1.6.14.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index ee3ff4fa8..8c107e990 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.13
+FREESWITCH_VERSION = 1.6.14
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
-- 
2.11.0
