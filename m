From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Mar 2017 17:05:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.15
Message-ID: <20170311160504.1856-1-bernd.kuhls@t-online.de>
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
index 6412511d5..4396e1ed6 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
 # From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.14.tar.xz.sha256
-sha256 759cb79800c02b9476fcec4c88822942ed6183d9c2686015e4c293e22790cf35  freeswitch-1.6.14.tar.xz
+sha256 95b38c07de200a43cd6963d21e0882ab8a7087473ea82ece68d76b9fa78ca27c  freeswitch-1.6.15.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 8c107e990..081b99fee 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.14
+FREESWITCH_VERSION = 1.6.15
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
-- 
2.11.0
