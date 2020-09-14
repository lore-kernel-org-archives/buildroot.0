From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Sep 2020 19:36:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/libupnpp: bump to version 0.19.4
In-Reply-To: <20200914173621.3405237-1-fontaine.fabrice@gmail.com>
References: <20200914173621.3405237-1-fontaine.fabrice@gmail.com>
Message-ID: <20200914173621.3405237-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index dde0d970cb..029e33151d 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.3.tar.gz.sha256
-sha256  a16f35ef1ce3d687e9599422c09677c2c1591bfcf68e242931082d4561f66be4  libupnpp-0.19.3.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.4.tar.gz.sha256
+sha256  29d1d07d44c8f79573e64e093ad8f0f883b11ef9eb3642a67aa703c1dde60576  libupnpp-0.19.4.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index a8db575984..fc4599ebc8 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.19.3
+LIBUPNPP_VERSION = 0.19.4
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.28.0
