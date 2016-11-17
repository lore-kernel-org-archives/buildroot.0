From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 17:08:57 +0000
Subject: [Buildroot] [PATCH next 1/9] gstreamer1/gstreamer1: bump version to
	1.10.1
Message-ID: <20161117170905.4691-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  https://gstreamer.freedesktop.org/releases/gstreamer/1.10.1.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 8bd7782..40677da 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.0.tar.xz.sha256sum
-sha256	1e7778fabe480185bfc4ce552f0860de1443f6618a68a86ccdd65854fed37207  gstreamer-1.10.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.1.tar.xz.sha256sum
+sha256 f68df996e0e699382b935bb4783dd402c301377df18f57e28e0318c4b3bff6da  gstreamer-1.10.1.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index cb111f2..794abc4 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.10.0
+GSTREAMER1_VERSION = 1.10.1
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.10.1
