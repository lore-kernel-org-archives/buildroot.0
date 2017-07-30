From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 18:24:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/ljsyscall: bump version to 0.12
Message-ID: <20170730162416.8653-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ljsyscall/ljsyscall.hash | 2 +-
 package/ljsyscall/ljsyscall.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
index 2d67907ab..114aa8420 100644
--- a/package/ljsyscall/ljsyscall.hash
+++ b/package/ljsyscall/ljsyscall.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9b5ba2b5798c5bc33aa2158f3b44f730de12497c195764aa1bc3d3f1244df198  ljsyscall-v0.10.tar.gz
+sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-v0.12.tar.gz
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 1c6c2c111..45e9e82b8 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJSYSCALL_VERSION = v0.10
+LJSYSCALL_VERSION = v0.12
 LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
-- 
2.11.0
