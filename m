From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:21:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/lrzip: bump to
 7f3bf46203bf45ea115d8bd9f310ea219be88af4
Message-ID: <20200531212156.C277485F60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21a29282339ed6938860f3273a387b84e91bba2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This bump contains only one commit that fix a build failure with asm:
https://github.com/ckolivas/lrzip/commit/844b8c057c8c7372ca41ad2efdbf849f45c24506

Fixes:
 - http://autobuild.buildroot.org/results/800d8a97966ef75dbf20e85ec8a02766ba02cc76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 18079e20a712c4a7d539ead52b0a0c725ec7f7e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index f3d5742620..447cf94ccc 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-8781292dd5833c04eeead51d4a5bd02dc6432dc7.tar.gz
+sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 32388b8e20..7419bb1ed9 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 8781292dd5833c04eeead51d4a5bd02dc6432dc7
+LRZIP_VERSION = 7f3bf46203bf45ea115d8bd9f310ea219be88af4
 LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
