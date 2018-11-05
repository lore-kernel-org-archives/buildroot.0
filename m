From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  5 Nov 2018 01:05:18 +0100
Subject: [Buildroot] [PATCH] package/meson: bump to version 0.47.2
Message-ID: <20181105000518.32336-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note, that there is already a patch [1] to bump the version to 0.48.1.
However, the bump to version 0.48.x has some unresolved issues.

In the meantime, until the issue with 0.48 is resolved, bump to latest
version of the 0.47 branch.

[1] http://patchwork.ozlabs.org/patch/986260/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 4a4923bd12..a9968977d4 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.47.1/meson-0.47.1.tar.gz.asc
-sha256 d673de79f7bab064190a5ea06140eaa8415efb386d0121ba549f6d66c555ada6 meson-0.47.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.47.2/meson-0.47.2.tar.gz.asc
+sha256 92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb meson-0.47.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 08e5c505c9..e1675c21b8 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.47.1
+MESON_VERSION = 0.47.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.19.1
