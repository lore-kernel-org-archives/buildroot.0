From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 14:34:34 +0100
Subject: [Buildroot] [git commit branch/next] mongodb: bump to version 3.3.2
Message-ID: <20160301133523.8FC09802B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eaa5a0e1b1da83a86d2f7dbb1bc55f151e40f1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 0bdd66d..e882d23 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 316496375f41f322839529d36e75e3275fdec468f7656fdbeb53ec8dc1ca5275  mongodb-r3.2.0.tar.gz
+sha256 26fc05802dfc1e7d1f30e4ed418ba2bc7396b6fa5b298c18d6c9945dff2b8d08  mongodb-r3.3.2.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 1027c83..6cc0b9e 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 3.2.0
+MONGODB_VERSION_BASE = 3.3.2
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
