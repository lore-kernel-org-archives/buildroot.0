From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 Jan 2017 16:05:41 +0000
Subject: [Buildroot] [PATCH] cjson: bump version to v1.2.1
Message-ID: <20170131160541.51329-1-Vincent.Riera@imgtec.com>
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
index a6370de..903880f 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 df549298ea6515058648eaacc62bcc4f82fa34f8b93af7753e30eb35c3841c7d  cjson-v1.2.0.tar.gz
+sha256 1d976ca423d714b7e836cfbc1980b56f49962d0dfe654edb3c2ffa5c713af242  cjson-v1.2.1.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index f0fe63b..11c34c5 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.2.0
+CJSON_VERSION = v1.2.1
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.10.2
