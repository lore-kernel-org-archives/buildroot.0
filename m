From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 May 2017 17:39:23 +0100
Subject: [Buildroot] [PATCH] cjson: bump version to 1.5.1
Message-ID: <20170508163923.5693-1-Vincent.Riera@imgtec.com>
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
index da6a8fc..09cc335 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 d320a180be80726d13b399b17dcaf226484dc362a8d7a1c6a9a9e3bd8eb184fd  cjson-v1.4.7.tar.gz
+sha256 81e6574f0b1c0d7cd34fa5e0f3fd34b162fc1c568fc1473880999c2030bfb6f0  cjson-v1.5.1.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 779cd3b..43cd8bd 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.7
+CJSON_VERSION = v1.5.1
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.10.2
