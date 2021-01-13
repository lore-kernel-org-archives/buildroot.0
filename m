From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:34:08 +0100
Subject: [Buildroot] [git commit] package/meson: bump to version 0.56.2
Message-ID: <20210113091840.D44AE876AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7805cace8b5941226302b114932460ab9b63733f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index b1f36ab9c3..e07b914be5 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.56.0/meson-0.56.0.tar.gz.asc
-sha256  291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213  meson-0.56.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.56.0/meson-0.56.2.tar.gz.asc
+sha256  3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4  meson-0.56.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e45eddcd7f..7e39883db3 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.56.0
+MESON_VERSION = 0.56.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
