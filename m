From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Feb 2019 20:49:49 +0100
Subject: [Buildroot] [PATCH/next v1 2/2] package/meson: bump version to
 0.49.2
In-Reply-To: <20190215194949.15118-1-ps.report@gmx.net>
References: <20190215194949.15118-1-ps.report@gmx.net>
Message-ID: <20190215194949.15118-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 3a5c7dd438..fadef6df8a 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.49.0/meson-0.49.0.tar.gz.asc
-sha256 fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551 meson-0.49.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.49.2/meson-0.49.2.tar.gz.asc
+sha256 ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd meson-0.49.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d76541cc93..49e27f5527 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.49.0
+MESON_VERSION = 0.49.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
