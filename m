From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 13 Jul 2019 08:58:26 +0200
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.0.2
In-Reply-To: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
References: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1563001107-17687-4-git-send-email-gilles.talis@gmail.com>
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
index ed4b127..e84dd8c 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8c744a5422dbffa0d1f92e90b34186fb8ed44db93fbacb55abd751ac8808d922	libwebp-1.0.1.tar.gz
+sha256	3d47b48c40ed6476e8047b2ddb81d93835e0ca1b8d3e8c679afbb3004dd564b1	libwebp-1.0.2.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 1aa81a0..e7235f4 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.0.1
+WEBP_VERSION = 1.0.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.7.4
