From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jun 2018 16:41:54 +0200
Subject: [Buildroot] [git commit] meson: bump version to 0.46.1
Message-ID: <20180609144026.320718634B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=574fba15fcea6c3b1a2e647e79d1bd6997d3b677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 44785aef29..bd9e4114ff 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.46.0/meson-0.46.0.tar.gz.asc
-sha256 b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0  meson-0.46.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.46.1/meson-0.46.1.tar.gz.asc
+sha256 19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78  meson-0.46.1.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 9b5ca0d5b9..28c9e6f202 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.46.0
+MESON_VERSION = 0.46.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
