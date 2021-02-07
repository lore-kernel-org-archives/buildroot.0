From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  7 Feb 2021 11:48:36 +0100
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.2.0
Message-ID: <20210207104836.516424-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fixed indentation in hash file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/webp/webp.hash | 4 ++--
 package/webp/webp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index a2d0000266..24cec6dfa3 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043	libwebp-1.1.0.tar.gz
-sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
+sha256  2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c  libwebp-1.2.0.tar.gz
+sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 5047965894..ecf26faa31 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.1.0
+WEBP_VERSION = 1.2.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.25.1
