From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:25:23 +0200
Subject: [Buildroot] [git commit] cargo: bump version to 0.26.0
Message-ID: <20180502122733.4B0FE8B485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04afb62b4d15f14da7d32379db806d0fdba12063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo/cargo.hash | 6 +++---
 package/cargo/cargo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cargo/cargo.hash b/package/cargo/cargo.hash
index 2a24e2e175..baa2cfbc33 100644
--- a/package/cargo/cargo.hash
+++ b/package/cargo/cargo.hash
@@ -1,8 +1,8 @@
 # Locally generated
-sha256 a9d4291254a1d622d3c3cb942aaa56ab4059b8d04915c3af234f0362f14722e8  cargo-0.24.0.tar.gz
+sha256 1a4bae6910ca895157a1abe8225eb2b7e9b49ee1ee1e4e72fb81cb8e1446bff9  cargo-0.26.0.tar.gz
 sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
 sha256 8bd89f9222dc80292f4107347103b693ac66f3a083371f0629ccf42338abe880  LICENSE-THIRD-PARTY
-# From https://src.fedoraproject.org/repo/pkgs/cargo/cargo-0.24.0-vendor.tar.xz/sha512
-sha512 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21  cargo-0.24.0-vendor.tar.xz
+# From https://src.fedoraproject.org/repo/pkgs/cargo/cargo-0.26.0-vendor.tar.xz/sha512
+sha512 6ed2a1644c9b18fc24ddad5350d41b6c36cd5b62de4cf0b748a57b589f4f0ac12f91461989158d58d0892bf6fc2c1626cf574e7e2b9da4b0e35f72dfd88f9048  cargo-0.26.0-vendor.tar.xz
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index b3174f5b20..1b1053ba41 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CARGO_VERSION = 0.24.0
+CARGO_VERSION = 0.26.0
 CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
 CARGO_LICENSE = Apache-2.0 or MIT
 CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
-CARGO_DEPS_SHA512 = 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21
+CARGO_DEPS_SHA512 = 6ed2a1644c9b18fc24ddad5350d41b6c36cd5b62de4cf0b748a57b589f4f0ac12f91461989158d58d0892bf6fc2c1626cf574e7e2b9da4b0e35f72dfd88f9048
 CARGO_DEPS_SITE = https://src.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)
 CARGO_DEPS_SOURCE = cargo-$(CARGO_VERSION)-vendor.tar.xz
 
