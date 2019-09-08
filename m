From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:43 -0700
Subject: [Buildroot] [PATCH 22/27] package/xxhash: bump to version 0.7.1
Message-ID: <20190908161243.27173-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update hash for xxhsum.c, only code changes, not license.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/xxhash/xxhash.hash | 5 +++--
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 7e068bd145..ab34527cac 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,5 @@
 # locally computed
-sha256  19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95  xxhash-0.6.5.tar.gz
 sha256  86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  LICENSE
-sha256  8e449f232e2cd984e1d286711653960b4a9a555d90b4dc05fe4f0d7a1838fe1b  xxhsum.c
+# Locally calculated
+sha256 61252c850db00893559fa1d23bb2e77d70f2912de1aa62df661c32f42411efdc xxhsum.c
+sha256 afa29766cfc0448ff4a1fd9f2c47e02c48d50be5b79749925d15d545008c3f81 xxhash-0.7.1.tar.gz
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index f9e207a1a6..289fb4f506 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.6.5
+XXHASH_VERSION = 0.7.1
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause, GPL-2.0+
 XXHASH_LICENSE_FILES = LICENSE xxhsum.c
-- 
2.20.1
