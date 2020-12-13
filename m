From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 17:42:08 +0100
Subject: [Buildroot] [PATCH 2/3] package/libupnpp: bump to version 0.20.1
In-Reply-To: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
References: <20201213164209.940947-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213164209.940947-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#_2020_11_26_libupnpp_0_20_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 029e33151d..f94ebc8e43 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.4.tar.gz.sha256
-sha256  29d1d07d44c8f79573e64e093ad8f0f883b11ef9eb3642a67aa703c1dde60576  libupnpp-0.19.4.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.20.1.tar.gz.sha256
+sha256  d4da986aeaa7124a1732ce3383b6ac8f28e20cab10f1916709f39e5499ae9c38  libupnpp-0.20.1.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index fc4599ebc8..1337e951a7 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.19.4
+LIBUPNPP_VERSION = 0.20.1
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.29.2
