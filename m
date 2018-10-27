From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 27 Oct 2018 19:39:32 +0200
Subject: [Buildroot] [PATCH] cargo-bin: bump version to 0.30.0
Message-ID: <20181027173932.9645-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 0.30.0.

The signature of the tarballs have been verified and their hash compared to the
upstream reference.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bin/cargo-bin.hash | 15 +++++++++------
 package/cargo-bin/cargo-bin.mk   |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index ad2da2bc00..2673e157af 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,9 +1,12 @@
-# From https://static.rust-lang.org/dist/cargo-0.27.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 64c2262c0577ef1824d3d885753362d68c04f36ea85a195894894c37e2445ef5  cargo-0.27.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 3688bea3d971615d9c4b33612c20783bd9a385539aa7f754e6543c196e1bcec2  cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d09c061daaafd735742e0b18a4da6eb656f61d4c57504d100a6ca9f766b38c71  cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 f8d7c27a40bba6343ee7dd39a324fe772b77824921adf3e9514a44d4e49059c8  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 cb7c63c166baa42ab0be08429e29fa59fc7108efd17ca512462b2645b1655a7f  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 82b020a43a..7fb4508a52 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CARGO_BIN_VERSION = 0.27.0
+CARGO_BIN_VERSION = 0.30.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
-- 
2.14.4
