From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:01:20 +0100
Subject: [Buildroot] [git commit branch/next] cjson: bump to version 1.3.0
Message-ID: <20170219220154.1741D8212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e5219b84dff676257f8ad32816e760c733bdcec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 903880f..0072725 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 1d976ca423d714b7e836cfbc1980b56f49962d0dfe654edb3c2ffa5c713af242  cjson-v1.2.1.tar.gz
+sha256	f1c528103844ffb992e17625ac8a3e8ee742021b1c2478e53cee4b085c0f413d	cjson-v1.3.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 11c34c5..5ff990e 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.2.1
+CJSON_VERSION = v1.3.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
