From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 23:21:19 +0200
Subject: [Buildroot] [git commit] cjson: bump to version 1.5.6
Message-ID: <20170706211949.3EA3581796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d60315ef39bbc2f261d4c6e304cf4b2cf0e9bea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 9e12791..a14223a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 f131a3067c78603683f84759de31320444f58d859a77afa77fca858d92ceba60  cjson-v1.5.5.tar.gz
+sha256 0ab704247ddb85b65f860923db78013c1376b632785cc3cde77aacddbeac7778  cjson-v1.5.6.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index dc1eb06..ef37b51 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.5
+CJSON_VERSION = v1.5.6
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
