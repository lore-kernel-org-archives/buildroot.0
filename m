From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Mar 2017 22:36:40 +0100
Subject: [Buildroot] [git commit] cjson: bump to version 1.4.2
Message-ID: <20170317223641.6B7FE81F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8972e4fe77425d0e805e7fd1dd3140bc6d524d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 2bcd5e2..03d6d36 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	8e1c389627c6275344000e063f2f3d8cb0c1354ca75cf95855e286f173d3bfb5	cjson-v1.4.0.tar.gz
+sha256	6bb0cec66f877f694ffd0e6026b33da1df28a204a9d3a65fbe5055d038a3e8bf	cjson-v1.4.2.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 4937821..6403c18 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.4.0
+CJSON_VERSION = v1.4.2
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
