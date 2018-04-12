From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 22:45:43 +0200
Subject: [Buildroot] [PATCH v4 11/11] gstreamer1-editing-services: bump to
 1.14.0
In-Reply-To: <20180412204543.25535-1-ps.report@gmx.net>
References: <20180412204543.25535-1-ps.report@gmx.net>
Message-ID: <20180412204543.25535-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index ddf9cecaed..78d1eea6c6 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.12.4.tar.xz.sha256sum
-sha256 bd7eaa2c9572db9e7e535064024b6f69250de864fe8a5d5be86fa8c7edacca0c  gstreamer-editing-services-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.14.0.tar.xz.sha256sum
+sha256 8d5f90eb532f4cf4aa1466807ef92b05bd1705970d7aabe10066929bbc698d91 gstreamer-editing-services-1.14.0.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 9b5a93eb75..f5930d989e 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.12.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.14.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.16.3
