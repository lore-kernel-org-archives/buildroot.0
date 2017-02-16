From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 21:59:52 +0100
Subject: [Buildroot] [git commit] json-c: bump to version 0.12.1-20160607
Message-ID: <20170301170421.A917F7FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1674fe0515c31bb546796ee1ed40f2e7600c694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: stick to the github helper]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 6550895..1868d75 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 99304a4a633f1ee281d6a521155a182824dd995139d5ed6ee5c93093c281092b  json-c-json-c-0.12-20140410.tar.gz
+sha256 989e09b99ded277a0a651cd18b81fcb76885fea08769d7a21b6da39fb8a34816  json-c-json-c-0.12.1-20160607.tar.gz
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 35243f1..7adbcaf 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = json-c-0.12-20140410
+JSON_C_VERSION = json-c-0.12.1-20160607
 JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
