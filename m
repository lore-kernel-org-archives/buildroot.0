From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Aug 2013 00:44:58 +0200
Subject: [Buildroot] [git commit] cjson: bump to version 58
Message-ID: <20130831213337.68E6C9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5043efe521176d091b6a7eff53b8a9e3cd2317f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also: update download site, and add new license file.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cjson/cjson.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
