From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 12 Apr 2016 09:39:05 -0300
Subject: [Buildroot] [PATCH] mongodb: bump to version 3.3.4
Message-ID: <1460464745-11380-1-git-send-email-sergio.prado@e-labworks.com>
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
index e882d23b52a9..b01ad53ab57e 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 26fc05802dfc1e7d1f30e4ed418ba2bc7396b6fa5b298c18d6c9945dff2b8d08  mongodb-r3.3.2.tar.gz
+sha256 4764945631bca4ac5c2b239e04e91db00e39716915204349170c37cb7897c564  mongodb-r3.3.4.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 6cc0b9e56b6c..f5b2c01db370 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 3.3.2
+MONGODB_VERSION_BASE = 3.3.4
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
-- 
1.9.1
