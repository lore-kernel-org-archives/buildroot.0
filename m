From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:26:48 +0100
Subject: [Buildroot] [git commit] package/icu: bump to version 68-1
Message-ID: <20201231140922.AB1868151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88f2d1c4e52607d2c2a1fa8d934152c47167a168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump icu to the newest release.

Tested in conjunction with qt 5.15.1 and a qt-based application.

The license file has changed with just URLs changes:

- # Project: http://code.google.com/p/lao-dictionary/
- # Dictionary: http://lao-dictionary.googlecode.com/git/Lao-Dictionary.txt
- # License: http://lao-dictionary.googlecode.com/git/Lao-Dictionary-LICENSE.txt
+ # Project: https://github.com/veer66/lao-dictionary
+ # Dictionary: https://github.com/veer66/lao-dictionary/blob/master/Lao-Dictionary.txt
+ # License: https://github.com/veer66/lao-dictionary/blob/master/Lao-Dictionary-LICENSE.tx

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 5c10008d8a..80cdd7df0c 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc  icu4c-67_1-src.tgz
-sha256  25e21013a7bc2fad735e28c5278a120e4c7f1c327c8c8b9b4df1751748cddbb2  LICENSE
+sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
+sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index c07ca2da3b..8d0288578c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 67-1
+ICU_VERSION = 68-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
