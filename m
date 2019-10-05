From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:06:06 +0200
Subject: [Buildroot] [git commit] package/libclc: bump version to latest
 commit in release_90 branch
Message-ID: <20191005200048.8BAA181805@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8047ed47ef39eed7419d3bd32d33f717fd7edca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v9.0.0, it was relicensed to the Apache License 2.0 with
LLVM Exceptions. Update the license file hash.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libclc/libclc.hash | 4 ++--
 package/libclc/libclc.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 6c06648fcf..29728fbc76 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 8d7b42fba6db4a124c74f0ac475c1bc515761cbf3d559820b4cbe5b33e94f26c libclc-dabae5a2afb78cba0320a86e3f5f0b5dc83e077c.tar.gz
-sha256 45187a46f0637e4e92decb51d8dc3c9e4957b349d0283dfbd6647e8000d9ac7f LICENSE.TXT
+sha256 5ea2cd2fa7fa1474d3e0580064e7a22014ef8d64dbbd7c546277fa4beb5acf86 libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060.tar.gz
+sha256 3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479 LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
index 17903c05d4..52249a7087 100644
--- a/package/libclc/libclc.mk
+++ b/package/libclc/libclc.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-# There are only two releases: release_35 and release_38, but the last
-# commit is from 2 years ago. Master has some recent activity.
-LIBCLC_VERSION = dabae5a2afb78cba0320a86e3f5f0b5dc83e077c
+# Use the latest commit from release_90 branch.
+LIBCLC_VERSION = d1cbc92e2ceee59963f5c3a576382e5bba31f060
 LIBCLC_SITE = https://git.llvm.org/git/libclc
 LIBCLC_SITE_METHOD = git
-LIBCLC_LICENSE = NCSA or MIT
+LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
 
 LIBCLC_DEPENDENCIES = host-clang host-llvm
