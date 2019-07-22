From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 22 Jul 2019 19:57:03 +0200
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.0.3
In-Reply-To: <1563818223-23023-1-git-send-email-gilles.talis@gmail.com>
References: <1563818223-23023-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1563818223-23023-2-git-send-email-gilles.talis@gmail.com>
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
index e84dd8c..0aae16e 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3d47b48c40ed6476e8047b2ddb81d93835e0ca1b8d3e8c679afbb3004dd564b1	libwebp-1.0.2.tar.gz
+sha256	e20a07865c8697bba00aebccc6f54912d6bc333bb4d604e6b07491c1a226b34f	libwebp-1.0.3.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index e7235f4..d5df3f5 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.0.2
+WEBP_VERSION = 1.0.3
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.7.4
