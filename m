From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:07:02 +0100
Subject: [Buildroot] [git commit branch/next] cjson: bump to version 1.7.2
Message-ID: <20180208220723.91E7C885E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73569ed6f8b66699b5d65dfb057dad3c99b56cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index ea2ecbb7e9..c72565d2bf 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 28ef8c069db19010b9af247b86b05f0f879ac914a4620997c3e5181465170b40  cjson-v1.7.1.tar.gz
+sha256 e5101b6c0416d26b8ce2dd3fcdd779eacd93d765a1872789ba099a5f31a338e7  cjson-v1.7.2.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 88a33a2ce4..31d57e1f2b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.1
+CJSON_VERSION = v1.7.2
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
