From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:23:51 +0200
Subject: [Buildroot] [git commit] cargo-bin: bump version to 0.30.0
Message-ID: <20181020172232.DBCC084446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15c00b9a235d8c087c37c9ad7770f5babbe6348a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo-bin/cargo-bin.hash | 12 ++++++------
 package/cargo-bin/cargo-bin.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index ad2da2bc00..96e90c6603 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,9 +1,9 @@
-# From https://static.rust-lang.org/dist/cargo-0.27.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 64c2262c0577ef1824d3d885753362d68c04f36ea85a195894894c37e2445ef5  cargo-0.27.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 3688bea3d971615d9c4b33612c20783bd9a385539aa7f754e6543c196e1bcec2  cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d09c061daaafd735742e0b18a4da6eb656f61d4c57504d100a6ca9f766b38c71  cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 4b828c263283241ad1c99f30e0b5d8554b6dac2737d09cfd466b4c15b0d7296a  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 3718a63fa744d9cd856d72a4fe3ac3b84ff34575a77da72667474c4726d56155  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 9524db722356307669c9068bb7df8dbd57e153717e62071b62560eb22ce2f3cd  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz
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
