From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Mar 2018 21:13:34 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.7.4
Message-ID: <20180305202144.2060C813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b405d31b48422d952e4f78e446490d611af8e2ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index c75854d2ac..2e615ad447 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 726a60137ab1aa6784dc575bf7d4c92f5367e937739c8bffcddce79071cf5f50  cjson-v1.7.3.tar.gz
+sha256 c3fc800cf9106db4ef5a5ef1fba7d144b21d73b68ad78234e182ebab12079277  cjson-v1.7.4.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 08020c48f6..7c302abbf5 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.3
+CJSON_VERSION = v1.7.4
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
