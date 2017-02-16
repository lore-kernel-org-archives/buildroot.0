From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 15 Feb 2017 22:14:27 -0500
Subject: [Buildroot] [PATCH 1/1] json-c: bump to version 0.12.1-20160607
Message-ID: <1487214867-3088-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, change the SITE of this version from the github helper to the release
tarball URL, as suggested by the buildroot manual.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 6550895..fb4c1e2 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 99304a4a633f1ee281d6a521155a182824dd995139d5ed6ee5c93093c281092b  json-c-json-c-0.12-20140410.tar.gz
+sha256 989e09b99ded277a0a651cd18b81fcb76885fea08769d7a21b6da39fb8a34816  json-c-0.12.1-20160607.tar.gz
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 35243f1..954b0b2 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_C_VERSION = json-c-0.12-20140410
-JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
+JSON_C_VERSION = 0.12.1-20160607
+JSON_C_SITE = https://github.com/json-c/json-c/archive
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPTS = --disable-oldname-compat
-- 
2.7.4
