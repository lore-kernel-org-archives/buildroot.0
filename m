From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 15:38:25 +0200
Subject: [Buildroot] [git commit] cjson: bump to version 1.5.5
Message-ID: <20170617133743.86CA580287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37ce45f1cc69786290e837e08e9a1730c3fb7d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index bc5fe21..9e12791 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 0fcf35ce2f28d8696f9cd92a0845d6210d981e2be4c6c6d55692fe3714e5b79b  cjson-v1.5.3.tar.gz
+sha256 f131a3067c78603683f84759de31320444f58d859a77afa77fca858d92ceba60  cjson-v1.5.5.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index a562eb2..dc1eb06 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.3
+CJSON_VERSION = v1.5.5
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
