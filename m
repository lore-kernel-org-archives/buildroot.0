From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:32:43 +0100
Subject: [Buildroot] [git commit] package/cog: bump to version 0.8.1
Message-ID: <20210314221214.F346487404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0965217c445b27c18a47576deb9d85021002e5fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This minor release contains a number of fixes and improves the reliability
of the build system.  Release notes:

  https://wpewebkit.org/release/cog-0.8.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index d76306ca54..2cafe8ca6e 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.8.0.tar.xz.sums
-md5  f7aa8a425927cab247563411fc67c5a3  cog-0.8.0.tar.xz
-sha1  977559204dae0f9220e4c6b8ded7537899fd2daf  cog-0.8.0.tar.xz
-sha256  181b1f4963cdf264b8068460a64d14c92a627f7138ebecc0f36fce085f4e92dd  cog-0.8.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.8.1.tar.xz.sums
+md5  21664fb04c9149dea6d68e13e6074276  cog-0.8.1.tar.xz
+sha1  baabba7f0f6009c64ef0c4f7c5f807382cffef5d  cog-0.8.1.tar.xz
+sha256  b82e917eb764943b9859c631974f8f0e748b79ae87bb7a944f46c818740e0208  cog-0.8.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 47a5573dda..c7fc5e6fee 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.8.0
+COG_VERSION = 0.8.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
