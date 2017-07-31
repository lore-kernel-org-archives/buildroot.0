From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:51:30 +0200
Subject: [Buildroot] [git commit] package/ljsyscall: bump version to 0.12
Message-ID: <20170731184759.526877FDA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0273d457165ff95d9208b39dd47131ca1441e1c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ljsyscall/ljsyscall.hash | 2 +-
 package/ljsyscall/ljsyscall.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
index 2d67907..114aa84 100644
--- a/package/ljsyscall/ljsyscall.hash
+++ b/package/ljsyscall/ljsyscall.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9b5ba2b5798c5bc33aa2158f3b44f730de12497c195764aa1bc3d3f1244df198  ljsyscall-v0.10.tar.gz
+sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-v0.12.tar.gz
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 1c6c2c1..45e9e82 100644
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
