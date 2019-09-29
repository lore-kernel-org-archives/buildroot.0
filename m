From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:16:54 +0200
Subject: [Buildroot] [PATCH 4/6] package/cargo-bin: bump version to 0.38.0
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171656.30187-5-eric.le.bihan.dev@free.fr>
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
index 0e9e9c5c61..a1c43e6c19 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,12 +1,12 @@
-# From https://static.rust-lang.org/dist/cargo-0.33.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 13acdb3c9f2505805ceed8a696f5f62ab8cd73e443cd43d6edd588aad88e1c32  cargo-0.33.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256 6628db22370f397676195555d768f0449a60f0a694bcac24611f4cd1cfc97cdc  cargo-0.33.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 c2c31db68c4dcb50ad856a19e6f11489a0d4df1212f31bd068dfbb73c5425761  cargo-0.33.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.38.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.38.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 a6c3781d8b2bf8619fc2231b01dc73877756c7bbbc1a68c521b9e748b3b7737a  cargo-0.38.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.38.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.38.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 8be0c71639c22e18815971079e46e7f3e5bce25365658ca39349e694321b92db  cargo-0.38.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.38.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/cargo-0.38.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 a3ba2df5e21aaba70e40bd289e4b3bab3df516c4e374c7178d3762338949df56  cargo-0.38.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 809bb64cae..388eb65880 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CARGO_BIN_VERSION = 0.33.0
+CARGO_BIN_VERSION = 0.38.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
-- 
2.21.0
