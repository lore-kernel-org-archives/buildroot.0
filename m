From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 16:00:11 +0200
Subject: [Buildroot] [git commit] package/mongodb: security bump to version
 4.2.9
Message-ID: <20200829135418.BB05F821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5919b6059c25e685a2ffc749f25c95e8edb96bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SERVER-47733 SymmetricEncryptorWindows shouldn???t pad when update is
called

https://docs.mongodb.com/manual/release-notes/4.2-changelog/#id1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 943ffda997..efbdf33e79 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e8880277e3910afd82c71ed61861d518f2040cbc062e00a26d53a3224284db8f  mongodb-src-r4.2.8.tar.gz
+sha256  4a8633ec92383864bb4b791f9776ef6f4652bf36b2c5a73557d1217ba85bca2b  mongodb-src-r4.2.9.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index fa111bef7b..d4af320105 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.8
+MONGODB_VERSION = 4.2.9
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
