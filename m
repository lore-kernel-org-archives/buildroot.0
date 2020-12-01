From: Heiko Stuebner <heiko@sntech.de>
Date: Tue,  1 Dec 2020 11:41:03 +0100
Subject: [Buildroot] [PATCH v2] package/icu: bump to version 68-1
Message-ID: <20201201104103.664200-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Bump icu to the newest release.

Tested in conjunction with qt 5.15.1 and a qt-based application.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
changes in v2:
- redo commit message
- drop the mention of the CVE, that was already fixed in 67.1

 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 5c10008d8a..8067b8e217 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc  icu4c-67_1-src.tgz
+sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
 sha256  25e21013a7bc2fad735e28c5278a120e4c7f1c327c8c8b9b4df1751748cddbb2  LICENSE
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
-- 
2.28.0
