From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:41:06 +0200
Subject: [Buildroot] [git commit] package/cog: bump to version 0.8.0
Message-ID: <20200922193137.C24398B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f72e04557338a6ed38e59b5e9ec1550fc63b2110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version adds a few features. Release notes:

  https://wpewebkit.org/release/cog-0.8.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index dc5c1b3c46..d76306ca54 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.6.0.tar.xz.sums
-md5  a97df4f0e2d25f4da7cd9bb55294d30e  cog-0.6.0.tar.xz
-sha1  9392d9251bab8a9f61d00297707e16a983127eae  cog-0.6.0.tar.xz
-sha256  208f58e0533b269400875237a95e994c93da7234a29fd1c904e756b88963e35d  cog-0.6.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.8.0.tar.xz.sums
+md5  f7aa8a425927cab247563411fc67c5a3  cog-0.8.0.tar.xz
+sha1  977559204dae0f9220e4c6b8ded7537899fd2daf  cog-0.8.0.tar.xz
+sha256  181b1f4963cdf264b8068460a64d14c92a627f7138ebecc0f36fce085f4e92dd  cog-0.8.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index a826252829..47a5573dda 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.6.0
+COG_VERSION = 0.8.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
