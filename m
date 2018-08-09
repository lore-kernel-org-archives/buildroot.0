From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:38:28 +0200
Subject: [Buildroot] [git commit branch/next] rust-bin: bump version to
 1.27.2
Message-ID: <20180809083239.62F8D80E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a878cdcf02876cda74c5b2ab019fb72ebf5651cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 60 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index a83dea911d..4ad5069486 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,33 +1,33 @@
-# From https://static.rust-lang.org/dist/rustc-1.27.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 739acc03d50c5fb2ce43037b0b54c37ac99bd1bef9ea61ee969b49a63d11315d  rustc-1.27.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.27.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d4c45e15d4ffb150f3eeef1fa2945a5ae541ab791f9464e9a4dcccba77bdf9c7  rustc-1.27.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256 1f9565cac16e600c68ebfb4fe50b1658462698b8d4a1e8392f8182c4e813d99d  rust-std-1.27.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256 a58026c1b441c45d21acc9b054232831fceb12f1906995754ef6aa9b20376d6a  rust-std-1.27.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 dc3ee826617487777bd70f52743baa499396c58cbdd3934cf57fa84624b84f05  rust-std-1.27.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 d846df9113718e3faaf77c7b29690a4f9a9f1432e7d001e2a1fee95514d92c79  rust-std-1.27.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 68f028911a1606e93eb71bdf95fe7d91e2b4cbd247663f3ab1e59d291dcd61b7  rust-std-1.27.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips-unknown-linux-gnu.tar.xz.sha256
-sha256 e15358613566b4a7721cfbebf424f850c771cf2acfc67ea170154447e81a7d5d  rust-std-1.27.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 a2c8a030964515328cf1cff5d72a53e2d8df30048382318378904df6bd019395  rust-std-1.27.1-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 27444c6892c978d294d24e26409bf924b6644822d18ef1d3e0d4fa3370e7d4da  rust-std-1.27.1-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-sha256 ac0c03e7d53439821c2d9eaf1311716b92fe347d83c1009bc031907b4ddef0f2  rust-std-1.27.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256 d2f2b88adb85af25699dd5e866d8e989660ef1a94561a9b73e4b7080e75ef6ee  rust-std-1.27.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256 80b6070996f297f4e9f802b014e88285914de03c1af7b087064035c9ece500bf  rust-std-1.27.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 a3c1843a583af8a38d49a403ea4e3013c8e1e0092a37353e62e69957fa1e9dbd  rust-std-1.27.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d3b0d00357cfaecf85651bea6f1d72793a5a859b6b07e9613ba21285922d5d58  rust-std-1.27.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.2-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 6d4e19c69231096d81acb9380b37613eab0af8779c70c1e8f76d526ae4b43c3d  rustc-1.27.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 927f88b5362e4b601caf619f64d609a88c03852fa505991c08c5f661fe71d7ac  rustc-1.27.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 1538eff6a3ecb62c362cf463686c28103bb162ea1274705e23116b5534f06c56  rust-std-1.27.2-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 ab17f722883767bce847b4edb15e9ede8ca95b9d0844f6c210a907fbed9ecb0d  rust-std-1.27.2-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 15715678f8c993f86174b588c7c026c7208e46ea0a1023753a473397b61b0cb7  rust-std-1.27.2-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 8390920c9b01c0f0eb08028033862e56062caf751b1aed658fbe3a78a1c5d0bf  rust-std-1.27.2-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 9467f43d225238f327047f5ce206f2138391c478f6212f0719c040daf298f81a  rust-std-1.27.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 73b6097147bb6af5d46cbf2369712fa6faae2b12a42d30d264ab8267492021d5  rust-std-1.27.2-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 352032f8d05c27f4bf5f1073f96dee576324ea8d96eecf823ca07319578b448e  rust-std-1.27.2-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 add721a331a520a4fac0689b82eefe3fe15a0330baca7ef5ad761b731ddfafdd  rust-std-1.27.2-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 54cc4af92445491127109bab1249d815f8bcbc26dcba46d8e1fe361dddc870f5  rust-std-1.27.2-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 30a638c82e3508685e1d9bec86ac7581b998425b0e76162fcef4e0eba4713dad  rust-std-1.27.2-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 7dc7a54cb8c567ab8061055533213bc4f491d042b5a61dc0645339ce2453d611  rust-std-1.27.2-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 6a0e27d22059b1aeb9fcd2b6d3683156f48002a9a0d2f1e2fedb60af589586d6  rust-std-1.27.2-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 d25e00b8a86956bdf0efe0b20d700081c3f279a1e92f86ccc15fb4deefa42e14  rust-std-1.27.2-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index cebca11133..923642f08d 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.27.1
+RUST_BIN_VERSION = 1.27.2
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
