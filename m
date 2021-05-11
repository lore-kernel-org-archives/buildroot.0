From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 10:24:27 +0200
Subject: [Buildroot] [git commit] package/elfutils: bump to version 0.184
Message-ID: <20210511075618.946ED7F9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f349d960899db48390a95b063b9d27fc5b2c96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/pipermail/elfutils-devel/2021q2/003797.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index c14a86e31f..9148758e29 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.183/sha512.sum
-sha512  bdafdd738a33cebe4f87849e5e6f1133881e77ef71b27faa0f0234ff80e9674f506957898326c2a55fd8438cbd189f7930597d0b4b9ca6c77921cc0cbd83b6b7  elfutils-0.183.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.184/sha512.sum
+sha512  5920c354edd6b28bb7e713d674bf6f2221e8ee91b90d582de39b1f45446aea1e7e3d4b6671024c391675b5e7530fe952c1320d730bb625c02d4c647ceb938bc8  elfutils-0.184.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 942949547a..c64224a90f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.183
+ELFUTILS_VERSION = 0.184
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
