From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 29 Mar 2017 14:07:23 +0100
Subject: [Buildroot] [PATCH] cjson: bump version to v1.4.5
Message-ID: <20170329130723.45349-1-Vincent.Riera@imgtec.com>
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
index 056a3ad..2e38a8b 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	59d77f80fc5bc401263ced056fa6da118bf12e2f9f1f35cc7bcaf749ac1f2bd8	cjson-v1.4.4.tar.gz
+sha256 3d0a61f2023749a6b813cadc713234a2ea393cf5482d910cf91584f13a82af13  cjson-v1.4.5.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index d0f5b6a..55417d1 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.4
+CJSON_VERSION = v1.4.5
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.10.2
