From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 21 Sep 2020 18:57:45 +0200
Subject: [Buildroot] [PATCH] package/xxhash: bump to version 0.8.0
Message-ID: <20200921165745.731730-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xxhash/xxhash.hash | 2 +-
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 5598b6495..feb500080 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  4d9706c9da4fbdf901598f5e3b71db0eddd4ac962e827a73ebf75d66dfd820fe  xxhash-0.7.4.tar.gz
+sha256  7054c3ebd169c97b64a92d7b994ab63c70dd53a06974f1f630ab782c28db0f4f  xxhash-0.8.0.tar.gz
 sha256  9da63520e9293d82c4b1613be5c84058cadb82b02f5972179bad13731d589910  LICENSE
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 6fbda50fb..c2ddbbd60 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.7.4
+XXHASH_VERSION = 0.8.0
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE
-- 
2.25.1
