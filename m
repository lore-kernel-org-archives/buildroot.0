From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2019 13:37:49 +0100
Subject: [Buildroot] [PATCH 5/7] webp: bump to version 1.0.1
In-Reply-To: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
References: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1547383071-11783-6-git-send-email-gilles.talis@gmail.com>
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
index 7dd954e..ed4b127 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	84259c4388f18637af3c5a6361536d754a5394492f91be1abc2e981d4983225b	libwebp-1.0.0.tar.gz
+sha256	8c744a5422dbffa0d1f92e90b34186fb8ed44db93fbacb55abd751ac8808d922	libwebp-1.0.1.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 3036474..1aa81a0 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.0.0
+WEBP_VERSION = 1.0.1
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.7.4
