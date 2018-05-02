From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  2 May 2018 11:53:30 +0200
Subject: [Buildroot] [PATCH 1/4] rust-bin: bump version to 1.25.0
In-Reply-To: <20180502095333.26940-1-eric.le.bihan.dev@free.fr>
References: <20180502095333.26940-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180502095333.26940-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.hash | 60 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  6 ++---
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 5b34a6aa0c..d09654307f 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,33 +1,33 @@
-# From https://static.rust-lang.org/dist/rustc-1.23.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 243de2826b2d545b8428414a3f7e86ce5e86163ec927a374958052a047b55e69  rustc-1.23.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.23.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 d72674a683dcc8a07ad72d6ae08b96a7dfc72cf08433e2ae69c0f8a2b9c79c17  rustc-1.23.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256 0d9c976c46a277ef860ce5766387ea8e40f84657e5f9962cba91be62a00ca345  rust-std-1.23.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256 3d7ce58f6d2bbf6faf91049893e96611a172b0af02d98190e36a49e8b0f974ee  rust-std-1.23.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 0a2a43668c2ddc2516e85e1c097d2672acaf61541d2b70f40daba548b3ccbee1  rust-std-1.23.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 b2f7f4e2e31d86302e929d0435b6f40778c22fc9306f0850b0edc4738ff2634e  rust-std-1.23.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 f9659f844ccd2e25e9f01a49fb7adf0ce26cbbec7a4df7081dd2d0929a86b2d3  rust-std-1.23.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips-unknown-linux-gnu.tar.xz.sha256
-sha256 8324d9c1eacba0de31fff29841d0f0567261489ee46a270e30be929095bfe19a  rust-std-1.23.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 521f70f3346ff8e28e33350fd5ad9bbba7dfc9038389f3965bcfa2f1d1a498a5  rust-std-1.23.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 d08f5792bd0d4f5d3d81a4ec1b3a2b36e7c389de2ecf2e777e390461ff015d08  rust-std-1.23.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-sha256 77291fff357b9e1764a4d7975bdbecdb37aeb0d37d85ccb68f7d785f4da1a056  rust-std-1.23.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256 d1b862d32c4921058ff4ea5b7fead3b2954b5f0f036603b1c58a600e602d1f25  rust-std-1.23.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256 e03bf7907914c88d2f19e719f07641b1b1ffbb65cf9daae8b028f4ab4619b4ff  rust-std-1.23.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 674f74245341119409e203109c22d432d0ed3312a6ff4d3b03cab251e61cc53a  rust-std-1.23.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.23.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 0d87225dd081c7ea5002fdeb21983d23bc52fa37d23c88d5c97b2c44660f8af9  rust-std-1.23.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.25.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 2b9b7d1df84a2a591c7f02faf082045eb5520cec70162249f941d8da006e97ec  rustc-1.25.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.25.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 f61766a970e067614037f2c788e3800d84b1bbc0c00c283ca0c6ecbc38559776  rustc-1.25.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 a9257edc85e9159b5953a9d68a3c1fbfe1306e2a5b752284ee4e4410deb96d73  rust-std-1.25.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 73ad54b1da0d100dc49e2a1ec425aecb6f38ffda334eb91fc6bb99fc30c301f5  rust-std-1.25.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 73bf215c2a5cc8068676f8d881a7464352e66f00946a0df81ac271fed16ebcfb  rust-std-1.25.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 ebfb2a21b54d610c5454445380628854fc880c8f4f6add4ffac27db6aa65a1a6  rust-std-1.25.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 6a6dba618372029f640d8a76342d957676cd9324084a1246ab6d5a89283e1d50  rust-std-1.25.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 85774d422307499b120841c78de7e920f7d1bdb2b8a9aca29607be467c5de9a0  rust-std-1.25.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 51347ff3c2cf1a1c55c22a3fecba6b155841e2e5a86ff5a077a7e96de096ff19  rust-std-1.25.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 e18a7259e58798bcbd6ad68ade35ea46201b9f370f3d2ead2e3d293cb2938d60  rust-std-1.25.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 9e60e356bd755aa3525f3fc4327e5ef64103e1198b9fbba9ad874e49a66877d7  rust-std-1.25.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 6908b1819e6b64ce3a2cbc33cccca10afda686efa60d6d91d4ce19213912f87e  rust-std-1.25.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 1ebe2c241514b41b492772eded30d6c601f41cd68e493cb31ebbdd39ffc5c2e9  rust-std-1.25.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 28a6200b05b6ab870c0700eb371201f0790ca24e9b3b8982db62fd21c1e846e2  rust-std-1.25.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.25.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 30c724d3fa01eb7dd448ef4a1fe63f6caa59f70c250b7d2ec3ede6be29c2505f  rust-std-1.25.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index b57849093d..e10dbcebd0 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.23.0
+RUST_BIN_VERSION = 1.25.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
@@ -25,8 +25,8 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
-	cd $(@D)/rustc/lib/rustlib; \
-		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)
+	cd $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME); \
+		ln -sf ../../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib
 endef
 
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
-- 
2.14.3
