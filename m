From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 16:48:28 +0100
Subject: [Buildroot] [PATCH-2020.02.x 10/11]
 package/gstreamer1-editing-services: bump version to 1.16.3
In-Reply-To: <20210121154829.9353-1-peter@korsgaard.com>
References: <20210121154829.9353-1-peter@korsgaard.com>
Message-ID: <20210121154829.9353-10-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 8724f39498..39caa1e049 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.2.tar.xz.sha256sum
-sha256 0e06a6191a0c6c16e16272bf2573cecaeb245f10629486ad940a299bef700c16 gstreamer-editing-services-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.3.tar.xz.sha256sum
+sha256 9b05cbb8a6f1db53999e7ad11f00f4f1ccc154d6805b7e49cb7755eb37a99ba6 gstreamer-editing-services-1.16.3.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index e2bb747d0a..e1ade54843 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.2
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.3
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.20.1
