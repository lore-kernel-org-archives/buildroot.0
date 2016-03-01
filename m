From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue,  1 Mar 2016 07:58:55 -0300
Subject: [Buildroot] [PATCH] mongodb: bump to version 3.3.2
Message-ID: <1456829935-15201-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 0bdd66db93f8..e882d23b52a9 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 316496375f41f322839529d36e75e3275fdec468f7656fdbeb53ec8dc1ca5275  mongodb-r3.2.0.tar.gz
+sha256 26fc05802dfc1e7d1f30e4ed418ba2bc7396b6fa5b298c18d6c9945dff2b8d08  mongodb-r3.3.2.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 1027c83fac18..6cc0b9e56b6c 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 3.2.0
+MONGODB_VERSION_BASE = 3.3.2
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
-- 
1.9.1
