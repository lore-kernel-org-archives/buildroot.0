From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Mar 2017 07:27:49 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.4.2
Message-ID: <1489732069-82557-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.5.0
