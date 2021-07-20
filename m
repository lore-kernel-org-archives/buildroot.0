From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jul 2021 10:08:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.58.2
Message-ID: <20210720160825.2801974-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 252e56ba34..96ca379a25 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.57.2/meson-0.57.2.tar.gz.asc
-sha256  3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5  meson-0.57.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.58.2/meson-0.58.2.tar.gz.asc
+sha256  7634ec32955d3f897d623b88e9d2988451035f43d73c17a29caf767387baedb7  meson-0.58.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 4b0f4fdeff..d093dc9fea 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.57.2
+MESON_VERSION = 0.58.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1
