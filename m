From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Apr 2017 10:17:17 +0100
Subject: [Buildroot] [PATCH] freeswitch: bump version to 1.6.16
Message-ID: <20170404091717.6119-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 4396e1e..1e79a4f 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.14.tar.xz.sha256
-sha256 95b38c07de200a43cd6963d21e0882ab8a7087473ea82ece68d76b9fa78ca27c  freeswitch-1.6.15.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.16.tar.xz.sha256
+sha256 4caecd8d246265db4e4d37df0901e396accd84de060525dda8212935cd2ee285  freeswitch-1.6.16.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 0ce67f0..b75cdab 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.15
+FREESWITCH_VERSION = 1.6.16
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPL-1.1, \
-- 
2.10.2
