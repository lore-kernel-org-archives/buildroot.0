From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 08:32:43 +0100
Subject: [Buildroot] [git commit] package/libshout: bump version to 2.4.5
Message-ID: <20210208071901.59421815AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c32cbb9392d3f089dda205c018890d2303b8fdd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha512 hash provided by upstream, reformatted hashes.

Changelog:
https://gitlab.xiph.org/xiph/icecast-libshout/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.hash | 9 ++++++---
 package/libshout/libshout.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
index 06702891c0..ae43e0a9c8 100644
--- a/package/libshout/libshout.hash
+++ b/package/libshout/libshout.hash
@@ -1,5 +1,8 @@
-# From https://downloads.xiph.org/releases/libshout/SHA256SUMS
-sha256	0d8af55d1141bf90710bcd41a768c9cc5adb251502a0af1dd22c8da215d40dfe	libshout-2.4.3.tar.gz
+# From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA512SUMS
+sha512  290844185da16961f03434d3e341573dd6cb0139e5fa81902903021b641382d2629302d7c356bc591b35656754e07f4e44a8d9e782e092b17a051b9ae8f54341  libshout-2.4.5.tar.gz
+
+# From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA256SUMS
+sha256  d9e568668a673994ebe3f1eb5f2bee06e3236a5db92b8d0c487e1c0f886a6890  libshout-2.4.5.tar.gz
 
 # Hash for license file
-sha256	7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852	COPYING
+sha256  7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852  COPYING
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 6537a1fea3..01ccf22e23 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHOUT_VERSION = 2.4.3
+LIBSHOUT_VERSION = 2.4.5
 LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
