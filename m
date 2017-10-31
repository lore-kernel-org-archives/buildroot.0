From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:09:53 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.6.0
Message-ID: <20171031190547.9711B7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c306f675f0d8af7a1ddbfa8dac8253709be2dab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index a14223a..e71b257 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 0ab704247ddb85b65f860923db78013c1376b632785cc3cde77aacddbeac7778  cjson-v1.5.6.tar.gz
+sha256 3d6277179282b00af232d9f97c9e0049ff212636d2a84791b03439c81d1f7b1e  cjson-v1.6.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ef37b51..f3ef7fd 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.6
+CJSON_VERSION = v1.6.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
