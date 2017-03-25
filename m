From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:37:09 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.4.4
Message-ID: <20170325133713.8680D82202@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a655a74d1aaf77ea5e38b5965f9e0b8aac7681b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 39ca2cb..056a3ad 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	3b362a6af73e10b0361119bc9fa9569578f9daa486cb487cad79322a34cd6965	cjson-v1.4.3.tar.gz
+sha256	59d77f80fc5bc401263ced056fa6da118bf12e2f9f1f35cc7bcaf749ac1f2bd8	cjson-v1.4.4.tar.gz
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
