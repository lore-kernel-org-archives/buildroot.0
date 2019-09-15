From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:45:07 +0200
Subject: [Buildroot] [git commit] package/xxhash: bump to version 0.7.1
Message-ID: <20190915194030.882EB8E592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96d714fb8c378237a3184df3b934e33b97f897d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

update hash for xxhsum.c, only code changes, not license.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.hash | 4 ++--
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 7e068bd145..6483830088 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95  xxhash-0.6.5.tar.gz
+sha256  afa29766cfc0448ff4a1fd9f2c47e02c48d50be5b79749925d15d545008c3f81  xxhash-0.7.1.tar.gz
 sha256  86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  LICENSE
-sha256  8e449f232e2cd984e1d286711653960b4a9a555d90b4dc05fe4f0d7a1838fe1b  xxhsum.c
+sha256  61252c850db00893559fa1d23bb2e77d70f2912de1aa62df661c32f42411efdc  xxhsum.c
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
