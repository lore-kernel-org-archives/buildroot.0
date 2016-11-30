From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 13:52:30 +0100
Subject: [Buildroot] [git commit branch/next] gstreamer1/gstreamer1: bump
	version to 1.10.2
Message-ID: <20161130125524.E38C781E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39864e2702490fd3da45a94ec6010ba95c17449f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 40677da..3fd7c6b 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.1.tar.xz.sha256sum
-sha256 f68df996e0e699382b935bb4783dd402c301377df18f57e28e0318c4b3bff6da  gstreamer-1.10.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.2.tar.xz.sha256sum
+sha256 150e8e81febac94c161d8141cde78a38038a8f56e8ec549f353da54994278d65  gstreamer-1.10.2.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 794abc4..6086e13 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.10.1
+GSTREAMER1_VERSION = 1.10.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
