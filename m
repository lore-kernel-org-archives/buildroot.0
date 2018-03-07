From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  7 Mar 2018 23:50:55 +0100
Subject: [Buildroot] [PATCH] meson: bump to version 0.45.0
Message-ID: <20180307225055.30090-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 279dd93a51..c460302f00 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.44.0/meson-0.44.0.tar.gz.asc
-sha256	50f9b12b77272ef6ab064d26b7e06667f07fa9f931e6a20942bba2216ba4281b	meson-0.44.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.45.0/meson-0.45.0.tar.gz.asc
+sha256	3455abbc30a3fbd9cc8abb6d5fcdc42ce618665b95ac2c3ad7792a4a6ba47ce4	meson-0.45.0.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 764c187ee7..2e0db90236 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.44.0
+MESON_VERSION = 0.45.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.16.2
