From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Dec 2016 22:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.13
Message-ID: <20161207212535.6479-1-bernd.kuhls@t-online.de>
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
index 5b888f5..76966cf 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.12.tar.xz.sha256
-sha256 ae072ca2d96fd9ef59ca6f589f932048b088c7b469d46e468bb917371de24ff9  freeswitch-1.6.12.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.13.tar.xz.sha256
+sha256 64a8a14fc5df92893d956868f144042891cc3e2d096bbf56241fec706635a8b7  freeswitch-1.6.13.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 12b0913..ee3ff4f 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.12
+FREESWITCH_VERSION = 1.6.13
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
-- 
2.10.2
