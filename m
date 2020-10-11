From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Oct 2020 21:35:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: security bump to version
 4.2.10
Message-ID: <20201011193551.1916306-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SERVER-50463 Make PooledLDAPConnection::refresh take self-ownership

https://docs.mongodb.com/manual/release-notes/4.2-changelog/#id1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index efbdf33e79..ab13d77651 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  4a8633ec92383864bb4b791f9776ef6f4652bf36b2c5a73557d1217ba85bca2b  mongodb-src-r4.2.9.tar.gz
+sha256  f44a846514f8db8be2a662210ad7fefc059d8e17ab2c59aceeae8b0b173d8286  mongodb-src-r4.2.10.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index d4af320105..6a1caf4fcb 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.9
+MONGODB_VERSION = 4.2.10
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
-- 
2.28.0
