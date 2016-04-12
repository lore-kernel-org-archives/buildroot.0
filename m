From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:21:37 +0200
Subject: [Buildroot] [git commit] mongodb: bump to version 3.3.4
Message-ID: <20160412220141.3158181DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fa21de867ec4963507d72ce698ce3f92a96943c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index e882d23..b01ad53 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 26fc05802dfc1e7d1f30e4ed418ba2bc7396b6fa5b298c18d6c9945dff2b8d08  mongodb-r3.3.2.tar.gz
+sha256 4764945631bca4ac5c2b239e04e91db00e39716915204349170c37cb7897c564  mongodb-r3.3.4.tar.gz
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 6cc0b9e..f5b2c01 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 3.3.2
+MONGODB_VERSION_BASE = 3.3.4
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
