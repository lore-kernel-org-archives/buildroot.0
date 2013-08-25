From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 25 Aug 2013 18:06:27 -0400
Subject: [Buildroot] [PATCH v2] cjson: bump to version 58
Message-ID: <1377468387-2288-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also: update download site, and add new license file.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

v1 -> v2: bug found, resulting in 58

v1: original update to version 57
---
 package/cjson/cjson.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ec976db..7e1d72d 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-CJSON_VERSION         = 42
+CJSON_VERSION         = 58
 CJSON_SITE_METHOD     = svn
-CJSON_SITE            = https://cjson.svn.sourceforge.net/svnroot/cjson
+CJSON_SITE            = http://svn.code.sf.net/p/cjson/code
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE         = MIT
+CJSON_LICENSE_FILES   = LICENSE
 
 define CJSON_BUILD_CMDS
 	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
-- 
1.7.9.5
