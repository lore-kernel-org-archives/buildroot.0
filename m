From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Feb 2017 23:16:07 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.3.2
Message-ID: <1488320167-62451-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 0072725..1ea4103 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	f1c528103844ffb992e17625ac8a3e8ee742021b1c2478e53cee4b085c0f413d	cjson-v1.3.0.tar.gz
+sha256	b2f6ba7c6e7145409d698674a4fc883aa16b8b6a2265eacbb80720fe0a0b2603	cjson-v1.3.2.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 481fcee..bb4c02a 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.3.0
+CJSON_VERSION = v1.3.2
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.5.0
