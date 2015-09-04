From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Fri,  4 Sep 2015 19:49:49 +0200
Subject: [Buildroot] [PATCH 1/5] package/at: updated version from 3.1.13 to
	3.1.16
Message-ID: <1441388989-540-1-git-send-email-francesco.nwokeka@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 package/at/at.hash | 9 +++++----
 package/at/at.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/at/at.hash b/package/at/at.hash
index 481c937..86f523b 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,4 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.13-2%2Bdeb7u1.dsc
-sha1	9873e0c38403ef58364912d0b505fd20798fd400  at_3.1.13.orig.tar.gz
-sha256	3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072  at_3.1.13.orig.tar.gz
-md5	1da61af6c29e323abaaf13ee1a8dad79  at_3.1.13.orig.tar.gz
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
+
+sha1    5ad64a471d0ed9985541e918e096f69dc2963cf0 123174 at_3.1.16.orig.tar.gz
+sha256  cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1 at_3.1.16.orig.tar.gz
+md5 d05da75d9b75d93917ffb16ab48b1e19 at_3.1.16.orig.tar.gz
diff --git a/package/at/at.mk b/package/at/at.mk
index 1504e32..8865360 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_VERSION = 3.1.13
+AT_VERSION = 3.1.16
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
 # missing deps for parsetime.l
-- 
2.5.1
