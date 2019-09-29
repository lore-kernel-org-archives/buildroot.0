From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:16:55 +0200
Subject: [Buildroot] [PATCH 5/6] package/rust-bin: bump version to 1.38.0
In-Reply-To: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171656.30187-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.hash | 90 +++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |  2 +-
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 96d81a347c..4c5978bdab 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,48 +1,48 @@
-# From https://static.rust-lang.org/dist/rustc-1.33.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.33.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 90b6414eddbce4a245cdcaea8353d3a637ef565d2bd119e25a6c2bf3e38cdf63  rustc-1.33.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 57c5ced1a826d34f26e50adf041528dd0000f2a59e8be32d2359386843382ce1  rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256 3e3449dada8306b3ff91f23c7803c7312a47e93af140f757b29b74f1e226a505  rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256 ddb372a43fb2ba9949e78643df43d6ae447b70cefd440ccdd6b9f6c2ff929ea7  rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256 1142d5064d8cbfab16ab71130e5a84804a1ebdfeb10173e6238adc0d757937b6  rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256 8492b5c91a9ea7ee7e22881382c1b9ad8bb9a4147aff0dfee09940b34783e3d5  rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 e945dd37ab9b143dbcbcdbeaba63b8de47411a4ff815d2e178f745e183078127  rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256 abf6b7050c1cdef092ecfde5128067434bb7989def19cfe95c06bfd71de07ba0  rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256 9cad816c989c991ffd342d03956b54209d7d32743ebb9b0624b2d36d5bbd525f  rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256 c7ac98e7a7c3757b5bb8bde596455d50a8787236e290bc1f49e2d59d486ae564  rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256 4ec3cade12e2e527f81d0b315e6a37152bf73938aab4a9216aef7d06ef913eb6  rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256 0ab78e0cb710f35d108abce90bbf426947fed6222d2f6c04c9eba4ca00adea06  rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256 4bc32bf4660a9fc5cd2af9e09f1bfb668b335442097fed6f3892b50950e97d3c  rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256 984d3ca2a47db04345a2bddd657761f66d209ef95a02097ad4bd549f45a0dc9f  rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 6f20343ed73faf5fdfc423bec38a9bb1910a0a962af6f2dddd7184407543ed0e  rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.38.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.38.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 183dca6a4d746b833804e658267c1a60cdb446a36d4e4f8d29b04cfd29d886d5  rustc-1.38.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.38.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.38.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 0fedde3406cf3367ceb00f493698e6bfc3264bd7f7253c85de7a042b45f873fa  rustc-1.38.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256 b931843898b0457fa92b8ef1521ff460bef525451ed786897cfaa6f7baed4105  rust-std-1.38.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256 a2cbc0e887896c518eea97af25383d0eeeb34b57fb10ba85917a802a63072043  rust-std-1.38.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256 64baa713e5913c6adcbca1a498d05248cef5877529c0c4a9e845aebd75484f7f  rust-std-1.38.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256 7fc0b85375865e7d3fd1e63446fc1b7a865ec537f880343797f32a1a3e0ecbce  rust-std-1.38.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 a3248cf8cf7e33afb0a2508c7c204ffe5db2e515c3d3d31ffd9a2146ffa3bad3  rust-std-1.38.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256 b9043d9d18285809881790601e06b58d835f457edb29acd0d21e45dfa5910fd9  rust-std-1.38.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256 b3469cea015cf0871df761d0aff72e82a3d27b8b100409b8d5d8a0cf775c0d4d  rust-std-1.38.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256 a836b87a78c023af5bd0fe9f9db0362a87b5df3ac7fcac43d30aefeb05158645  rust-std-1.38.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256 7d238edab91a2f681986c61c2dab5d37b9c85580c0338ff64c89780b8ccf829e  rust-std-1.38.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256 b892b009abc974eec1b08acce92d654c804f168dcc59d7de8fb49effe1d0c986  rust-std-1.38.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256 9359f21093515299b6f0f3ded6e90a0ce7ec4615509f319f33e9889bb543304b  rust-std-1.38.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 937d2ece46539ba149cdce307718dadbc4b038a3c751bd75749430bd421a6249  rust-std-1.38.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.38.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.38.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 51b334337804baeff7524e5496d396f254894d7529860d236975e9ed8fcca371  rust-std-1.38.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index a374215e20..a5a251367b 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.33.0
+RUST_BIN_VERSION = 1.38.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.21.0
