From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 18 Jan 2020 13:24:50 +0100
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.1.0
Message-ID: <20200118122450.22599-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 0aae16ef8f..a2d0000266 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e20a07865c8697bba00aebccc6f54912d6bc333bb4d604e6b07491c1a226b34f	libwebp-1.0.3.tar.gz
+sha256	98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043	libwebp-1.1.0.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d5df3f5da0..4a94554984 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.0.3
+WEBP_VERSION = 1.1.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.17.1
