From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:44:04 +0200
Subject: [Buildroot] [git commit] cargo-bin: bump version to 0.27.0
Message-ID: <20180718093941.CE31088890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0e8f4a50d9cdd1818b8a0acea24905a43d7ca17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo-bin/cargo-bin.hash | 12 ++++++------
 package/cargo-bin/cargo-bin.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index 2dfea7c868..ad2da2bc00 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,9 +1,9 @@
-# From https://static.rust-lang.org/dist/cargo-0.26.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 bc5f5aa32d2f4ba26abf79a900231d06eecc7f1f2e125ed51bf71766550d1879  cargo-0.26.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.26.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 b14b47f59b436d07e57c5eab5bdd7378842b8ef4873d5836e08f0391e743f516  cargo-0.26.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 aeaa5813aa6615dd7fdde6d870ca257c5b2e9da5e308f8242a08b231605bce0e  cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.27.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 64c2262c0577ef1824d3d885753362d68c04f36ea85a195894894c37e2445ef5  cargo-0.27.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 3688bea3d971615d9c4b33612c20783bd9a385539aa7f754e6543c196e1bcec2  cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 d09c061daaafd735742e0b18a4da6eb656f61d4c57504d100a6ca9f766b38c71  cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 0c017bdb43..82b020a43a 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CARGO_BIN_VERSION = 0.26.0
+CARGO_BIN_VERSION = 0.27.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
 CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
