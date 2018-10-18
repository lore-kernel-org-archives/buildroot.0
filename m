From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 18 Oct 2018 22:58:33 +0200
Subject: [Buildroot] [PATCH 1/3] rust-bin: bump version to 1.29.2
In-Reply-To: <20181018205835.8719-1-eric.le.bihan.dev@free.fr>
References: <20181018205835.8719-1-eric.le.bihan.dev@free.fr>
Message-ID: <20181018205835.8719-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.hash | 60 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 4ad5069486..36f959f257 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,33 +1,33 @@
-# From https://static.rust-lang.org/dist/rustc-1.27.2-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 6d4e19c69231096d81acb9380b37613eab0af8779c70c1e8f76d526ae4b43c3d  rustc-1.27.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.27.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 927f88b5362e4b601caf619f64d609a88c03852fa505991c08c5f661fe71d7ac  rustc-1.27.2-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256 1538eff6a3ecb62c362cf463686c28103bb162ea1274705e23116b5534f06c56  rust-std-1.27.2-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256 ab17f722883767bce847b4edb15e9ede8ca95b9d0844f6c210a907fbed9ecb0d  rust-std-1.27.2-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 15715678f8c993f86174b588c7c026c7208e46ea0a1023753a473397b61b0cb7  rust-std-1.27.2-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 8390920c9b01c0f0eb08028033862e56062caf751b1aed658fbe3a78a1c5d0bf  rust-std-1.27.2-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 9467f43d225238f327047f5ce206f2138391c478f6212f0719c040daf298f81a  rust-std-1.27.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips-unknown-linux-gnu.tar.xz.sha256
-sha256 73b6097147bb6af5d46cbf2369712fa6faae2b12a42d30d264ab8267492021d5  rust-std-1.27.2-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 352032f8d05c27f4bf5f1073f96dee576324ea8d96eecf823ca07319578b448e  rust-std-1.27.2-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 add721a331a520a4fac0689b82eefe3fe15a0330baca7ef5ad761b731ddfafdd  rust-std-1.27.2-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-mipsel-unknown-linux-gnu.tar.xz.sha256
-sha256 54cc4af92445491127109bab1249d815f8bcbc26dcba46d8e1fe361dddc870f5  rust-std-1.27.2-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256 30a638c82e3508685e1d9bec86ac7581b998425b0e76162fcef4e0eba4713dad  rust-std-1.27.2-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256 7dc7a54cb8c567ab8061055533213bc4f491d042b5a61dc0645339ce2453d611  rust-std-1.27.2-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 6a0e27d22059b1aeb9fcd2b6d3683156f48002a9a0d2f1e2fedb60af589586d6  rust-std-1.27.2-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.27.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d25e00b8a86956bdf0efe0b20d700081c3f279a1e92f86ccc15fb4deefa42e14  rust-std-1.27.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.29.2-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 d251b3ade6a66856ff62ea86ed8d34f8cc2a9cd683bf42c3b0c0345f0d955b7c  rustc-1.29.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.29.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 b0ea41cd20caf9af62394601b09d2c8b12814293f3cc1247a8c61fb672477499  rustc-1.29.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 df62bdb6839e313f8f9c3a92b4de63ba2c37b9c7b534449a392db1ede0f6a741  rust-std-1.29.2-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 7729765dab2945c688d0f10faf313c14aed22f6cfdc96a0a07292292662f260a  rust-std-1.29.2-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 5e4f02edccd013b19b6d03c2a28bff4f81b9cdf7475882e1480aeb21378f93cf  rust-std-1.29.2-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 d7e6ba57e790fc4e5d02c0b4b0471178b05341cf932bfc349b90ced9b939209e  rust-std-1.29.2-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 4e8c54a54b3060cde9e24d0c32585360098cc75a120543429ccf498d8b83b5d0  rust-std-1.29.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 556596ac7e2dc462573e8379fd1596dc59394044b3a11f0c50f54642439cf8ab  rust-std-1.29.2-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 8dac2dfc4db7932e6214e98494824453a7be8bb42cf29d5395cc2363fc2fb0c2  rust-std-1.29.2-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 361d70abfc27b7fdbe8642bc7413f9b55463e90350465de96183ff048fcf149f  rust-std-1.29.2-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 8005463e56932bdf272a047281cc20087db68d8fef4cbcf8cf4edf9a2260f8cc  rust-std-1.29.2-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 6cda45f5ee39dbfef95d516a1e0e25744b11d1a8147188b71c21f85f65bca9a9  rust-std-1.29.2-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 612f175c895a495e401205025805a9e8dffa53b2f105a55f92894b159a87fe28  rust-std-1.29.2-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 16034975bd09b57eb1579b659010f83b869733c9c018c2a189a385fa77923875  rust-std-1.29.2-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.29.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 be16e9db4e39e5e1af0621eea715d13e0fdc56f7b14c3d7310905dc34dfa618a  rust-std-1.29.2-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 7011e188bd..624ec94b40 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.27.2
+RUST_BIN_VERSION = 1.29.2
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.14.4
