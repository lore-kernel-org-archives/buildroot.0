From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jul 2020 12:12:13 +0200
Subject: [Buildroot] [PATCH 1/5] package/libhttpserver: bump version to
 0.18.1
Message-ID: <20200705101217.630684-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 0791d800b8..038e9f6b77 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b4a745a9f32a1ac02b545c062fc85342a655c3770cd8d4d7218f34509ea27d98  libhttpserver-0.18.0.tar.gz
+sha256  c830cb40b448a44cfc9000713aefff15d4ab1f6ebd6b47280a3cb64cb020f326  libhttpserver-0.18.1.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 170d46b06a..37943bc497 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.18.0
+LIBHTTPSERVER_VERSION = 0.18.1
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
-- 
2.26.2
