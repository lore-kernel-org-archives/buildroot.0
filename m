From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:32:21 +0200
Subject: [Buildroot] [git commit] package/libbson: bump version to 1.9.5
Message-ID: <20191007202656.F176580259@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb53f51666111dfd5a3ac5f721d2d0478bcabff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbson/libbson.hash | 2 +-
 package/libbson/libbson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
index b20a0cd8d4..568459900a 100644
--- a/package/libbson/libbson.hash
+++ b/package/libbson/libbson.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	c3cc230a3451bf7fedc5bb34c3191fd23d841e65ec415301f6c77e531924b769 libbson-1.9.4.tar.gz
+sha256	6bb51b863a4641d6d7729e4b55df8f4389ed534c34eb3a1cda906a53df11072c libbson-1.9.5.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
 sha256	8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e THIRD_PARTY_NOTICES
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
index 2c9cbc7fe0..931df333ca 100644
--- a/package/libbson/libbson.mk
+++ b/package/libbson/libbson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSON_VERSION = 1.9.4
+LIBBSON_VERSION = 1.9.5
 LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
 LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
 LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
