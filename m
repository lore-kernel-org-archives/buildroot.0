From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Dec 2016 09:11:02 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.1.0
Message-ID: <20161210081349.593CE818EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=190c5117c0bd04cdeec28bbb456debbeea8a2919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 27f1d46..4f0723a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	5c3a4a77796b230efbd74369b0974d14ac0408f2677bd116d4a4b5894b9be372	cjson-v1.0.2.tar.gz
+sha256	3487795d54440bdbd41b4b8e7688889526f2f9a652639f6036b9965016c800e7	cjson-v1.1.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index c544a77..3dd6ebc 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.0.2
+CJSON_VERSION = v1.1.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
