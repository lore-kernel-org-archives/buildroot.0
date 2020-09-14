From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Sep 2020 19:36:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnpupnp: bump to version 4.0.11
Message-ID: <20200914173621.3405237-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 3bad603269..53a0c16fd3 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.10.tar.gz.sha256
-sha256  a682d0584d79acd5a4d551ae18efc83cb0765624da27fb0edcd47e3fb94418f9  libnpupnp-4.0.10.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.11.tar.gz.sha256
+sha256  15b73a5197e649afe44dd15002be131b4b0e20a2b2e9b7ea4a2000b9644fefae  libnpupnp-4.0.11.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 4575ad40f2..23cc52c169 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.0.10
+LIBNPUPNP_VERSION = 4.0.11
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
-- 
2.28.0
