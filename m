From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Mar 2017 11:29:32 +0000
Subject: [Buildroot] [PATCH] cjson: bump version to v1.4.4
Message-ID: <20170324112932.30041-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 39ca2cb..d6e5af7 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	3b362a6af73e10b0361119bc9fa9569578f9daa486cb487cad79322a34cd6965	cjson-v1.4.3.tar.gz
+sha256 59d77f80fc5bc401263ced056fa6da118bf12e2f9f1f35cc7bcaf749ac1f2bd8  cjson-v1.4.4.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 6872b10..d0f5b6a 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.3
+CJSON_VERSION = v1.4.4
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.10.2
