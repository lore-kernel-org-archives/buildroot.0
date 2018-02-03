From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 19:57:10 +0100
Subject: [Buildroot] [git commit] axfsutils: bump version
Message-ID: <20180203190214.977C0882B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c34e6e40af9ae43d0ed9ad0b41a609118cd849cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This updated version fixes memory violations, memory leaks, compiler
warnings and includes updated documentation on usage.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axfsutils/axfsutils.hash | 2 +-
 package/axfsutils/axfsutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
index f7fc659675..3ef5c5876f 100644
--- a/package/axfsutils/axfsutils.hash
+++ b/package/axfsutils/axfsutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2f3bb1ebc0eda1a8d09e927dd8db271fb7ceade06a331cd2369b27c3fd8d5f2f axfsutils-719ab26ca3e61200adc1d643dc89d494a75ee59f.tar.gz
+sha256 7d8c0febaf6f104c2b179475ea1ee6d361688ad7fa4c98dfdf7395fcff2be685 axfsutils-384a1ea214c8cf8359faba00a12513ee7ae1a9f5.tar.gz
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index de6d849269..8879221619 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXFSUTILS_VERSION = 719ab26ca3e61200adc1d643dc89d494a75ee59f
+AXFSUTILS_VERSION = 384a1ea214c8cf8359faba00a12513ee7ae1a9f5
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
 AXFSUTILS_LICENSE = GPL-2.0
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
