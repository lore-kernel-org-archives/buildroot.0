From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:25:22 +0200
Subject: [Buildroot] [git commit] cargo-bin: bump version to 0.26.0
Message-ID: <20180502122733.3056D8B485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88612cf323321f354213e5f894e46fee36756730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo-bin/cargo-bin.hash | 8 ++++----
 package/cargo-bin/cargo-bin.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index ea121547b4..f01c3f5ff2 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,7 +1,7 @@
-# From https://static.rust-lang.org/dist/cargo-0.24.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 6ffc847e0ee2a1273223ce500f7b212d051e99a6d234e34585d0c55e21a963ea  cargo-0.24.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.24.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 93b953c8c7a2088aef952de8dccd7f6ccf9b21bf94b735d3909961ffe831da8c  cargo-0.24.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.26.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 bc5f5aa32d2f4ba26abf79a900231d06eecc7f1f2e125ed51bf71766550d1879  cargo-0.26.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 aeaa5813aa6615dd7fdde6d870ca257c5b2e9da5e308f8242a08b231605bce0e  cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 3c834d9033..0c017bdb43 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CARGO_BIN_VERSION = 0.24.0
+CARGO_BIN_VERSION = 0.26.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
