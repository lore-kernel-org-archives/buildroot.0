From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 13 Jul 2020 22:27:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/wine: bump version to 5.12
Message-ID: <20200713202758.14081-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file formatting (2 spaces).

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/wine/wine.hash | 6 +++---
 package/wine/wine.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index e6d0ef88ed..08abccb4a8 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 181550ba69a80b00c631f80c28ff7642264613bbecdb0c0fc04d6534866713b4 wine-5.0.tar.xz
+sha256  87f17254c6794ec6eeb7020b164c859983c9df0dacdd66d6449ff000498c842e  wine-5.12.tar.xz
 # Locally calculated
-sha256 e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c COPYING.LIB
-sha256 f3ca909e68d38c972e8ded5248b4745958dbb26f2e581ad73cfbedb6b0408e58 LICENSE
+sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
+sha256  f3ca909e68d38c972e8ded5248b4745958dbb26f2e581ad73cfbedb6b0408e58  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a4b6c6a15f..7d7b22a137 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 5.0
+WINE_VERSION = 5.12
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/5.0
+WINE_SITE = https://dl.winehq.org/wine/source/5.x
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
-- 
2.20.1
