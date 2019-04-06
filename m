From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  6 Apr 2019 16:42:09 +0200
Subject: [Buildroot] [PATCH 1/3] cargo-bin: bump version to 0.33.0
In-Reply-To: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
References: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190406144211.20894-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bin/cargo-bin.hash | 18 +++++++++---------
 package/cargo-bin/cargo-bin.mk   |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index 2673e157af..0e9e9c5c61 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,12 +1,12 @@
-# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256 f8d7c27a40bba6343ee7dd39a324fe772b77824921adf3e9514a44d4e49059c8  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 cb7c63c166baa42ab0be08429e29fa59fc7108efd17ca512462b2645b1655a7f  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.33.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 13acdb3c9f2505805ceed8a696f5f62ab8cd73e443cd43d6edd588aad88e1c32  cargo-0.33.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 6628db22370f397676195555d768f0449a60f0a694bcac24611f4cd1cfc97cdc  cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 c2c31db68c4dcb50ad856a19e6f11489a0d4df1212f31bd068dfbb73c5425761  cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 7fb4508a52..3614f7a53d 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CARGO_BIN_VERSION = 0.30.0
+CARGO_BIN_VERSION = 0.33.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
-- 
2.17.2
