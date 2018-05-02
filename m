From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:25:20 +0200
Subject: [Buildroot] [git commit] rust: bump version to 1.25.0
Message-ID: <20180502122733.195CF810E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=853ce4d581168587a39a338bb0b619dec3df4798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust/rust.hash | 4 ++--
 package/rust/rust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index d6731b6dc2..495722e355 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,5 @@
-# From https://static.rust-lang.org/dist/rustc-1.23.0-src.tar.xz.sha256
-sha256 7196032371b50dd5582465b3bfa79ffd783b74f0711420d99b61b26c96fb3d80  rustc-1.23.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.25.0-src.tar.xz.sha256
+sha256 14fcb82d5959df758aaf422539359300917217fa8420e34bd596e3fb6ed2de87  rustc-1.25.0-src.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index ff2634b996..af5c366495 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.23.0
+RUST_VERSION = 1.25.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
