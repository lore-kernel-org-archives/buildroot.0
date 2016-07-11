From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 11 Jul 2016 09:54:40 +0200
Subject: [Buildroot] [PATCH] package/libv4l: bump version to 1.10.1
Message-ID: <20160711075440.27051-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index d58296f..2bf17ee 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	78ead27ee58a701d7c6342303cf4520bdd4a2b88a7813bc99a0b389307e4336b	v4l-utils-1.10.0.tar.bz2
+sha256	6147ccc29fe7dd3c5c3994d613c4f2a099bac8b44694a96e5cf4d7caca8336c0	v4l-utils-1.10.1.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index d0a3f2b..d557414 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.10.0
+LIBV4L_VERSION = 1.10.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.9.0
