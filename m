From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 12:01:34 +0100
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 4.0.21
Message-ID: <20210106104731.EF64F814D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6958aca51e3a2ca62ea86950e42ad7d74745ea9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/Config.in          | 2 +-
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 1d927bb4ea..dff6688e83 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 	  minimal CPU and memory resources, and provide fast throughput
 	  in both directions.
 
-	  http://libwebsockets.org/
+	  https://libwebsockets.org/
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 3963370710..1761a7658a 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a26d243f2642a9b810e7d91f1e66b149d1da978decdca58ce1c9218c454f397e  libwebsockets-4.0.20.tar.gz
+sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
 sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 8e6d02205a..6f752f998e 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.0.20
+LIBWEBSOCKETS_VERSION = 4.0.21
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
