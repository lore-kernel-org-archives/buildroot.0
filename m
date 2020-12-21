From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 12:58:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: bump to version 4.2.11
Message-ID: <20201221115849.294721-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://docs.mongodb.com/master/release-notes/4.2-changelog/#id1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index ab13d77651..3b2580cc43 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  f44a846514f8db8be2a662210ad7fefc059d8e17ab2c59aceeae8b0b173d8286  mongodb-src-r4.2.10.tar.gz
+sha256  ab5a8b6e967614a8ad67c0ca87124c4f380d4a476508973a7995d54ed902b02e  mongodb-src-r4.2.11.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 6a1caf4fcb..e16bb2a169 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.10
+MONGODB_VERSION = 4.2.11
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
-- 
2.29.2
