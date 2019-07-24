From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 25 Jul 2019 00:12:06 +0200
Subject: [Buildroot] [PATCH 5/6] package/rust-bin: bump version to 1.36.0
In-Reply-To: <20190724221207.9686-1-eric.le.bihan.dev@free.fr>
References: <20190724221207.9686-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190724221207.9686-6-eric.le.bihan.dev@free.fr>
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
index 96d81a347c..d48ae8e1c3 100644
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
+# From https://static.rust-lang.org/dist/rustc-1.36.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.36.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 ad86a75cc8a02a0129df480ccb28082985215f4b5558a42881777691ae1d3ff3  rustc-1.36.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.36.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.36.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 fff0158da6f5af2a89936dc3e0c361077c06c2983eb310615e02f81ebbde1416  rustc-1.36.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256 46c96cdca589e0b256e59370a6c9a1126f00cdd48b5659b638aa4dd7198b0406  rust-std-1.36.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256 50d5d644045c035f5f851bdfd85dee1929fb1be6116760708c4c9505ce7ed924  rust-std-1.36.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256 ba2b90d1ea64d5c4e86df5f4911c4eb6485c3874c3faa1ef56b2195d1ebcdae9  rust-std-1.36.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256 f88a34f4e6ea2bedbd3a6dcc91641869eb0c87c7311dd8e4469fa6a93fe3b224  rust-std-1.36.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 a78f7bdbce0a960f3334c6c639cbe96f05b9b74df26cda9a5161834098119217  rust-std-1.36.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256 94ea494feeb51b58c198e4e50772a0ab77d8911ddd4755990c37a2ceb0c1dd83  rust-std-1.36.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256 5ff91bba1fc46ca46f4b300b08df65ddcffcf78a9768de15fccdbbcc18f4b36f  rust-std-1.36.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256 f6c33fa5ebdab91ca9540cfe46850481a9674913db11a47c398a2f4d924dc96d  rust-std-1.36.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256 0f37e339ae07a09f2e564cf57b978720a21520da781329b730569e4da5fc42af  rust-std-1.36.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256 b22c7104c1bea83aef920140a25be974c3e08dd600431901346908916be46f43  rust-std-1.36.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256 886b723a04d52bd96c9470e72a568f86b9010d128b3c403d199bc1f50694dea3  rust-std-1.36.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 db7a9a06b8b1b84d6fe10bc1e2e136234e31bfaa77499b9df36e2d441ef1b856  rust-std-1.36.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.36.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.36.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 ce8e12684b568a8a4f7d346a743383429849cf3f028f5712ad3d3e31590c8db3  rust-std-1.36.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index a374215e20..cae3c1ced5 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.33.0
+RUST_BIN_VERSION = 1.36.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.20.1
