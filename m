From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:44:01 +0200
Subject: [Buildroot] [git commit] rust-bin: bump version to 1.27.1
Message-ID: <20180718093941.B024088890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9ad75b4c13925bfa8586601d2ae31b2df87eb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 60 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d09654307f..a83dea911d 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,33 +1,33 @@
-# From https://static.rust-lang.org/dist/rustc-1.25.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 2b9b7d1df84a2a591c7f02faf082045eb5520cec70162249f941d8da006e97ec  rustc-1.25.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.25.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 f61766a970e067614037f2c788e3800d84b1bbc0c00c283ca0c6ecbc38559776  rustc-1.25.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256 a9257edc85e9159b5953a9d68a3c1fbfe1306e2a5b752284ee4e4410deb96d73  rust-std-1.25.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256 73ad54b1da0d100dc49e2a1ec425aecb6f38ffda334eb91fc6bb99fc30c301f5  rust-std-1.25.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 73bf215c2a5cc8068676f8d881a7464352e66f00946a0df81ac271fed16ebcfb  rust-std-1.25.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 ebfb2a21b54d610c5454445380628854fc880c8f4f6add4ffac27db6aa65a1a6  rust-std-1.25.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 6a6dba618372029f640d8a76342d957676cd9324084a1246ab6d5a89283e1d50  rust-std-1.25.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips-unknown-linux-gnu.tar.xz.sha256
-sha256 85774d422307499b120841c78de7e920f7d1bdb2b8a9aca29607be467c5de9a0  rust-std-1.25.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 51347ff3c2cf1a1c55c22a3fecba6b155841e2e5a86ff5a077a7e96de096ff19  rust-std-1.25.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 e18a7259e58798bcbd6ad68ade35ea46201b9f370f3d2ead2e3d293cb2938d60  rust-std-1.25.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-sha256 9e60e356bd755aa3525f3fc4327e5ef64103e1198b9fbba9ad874e49a66877d7  rust-std-1.25.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256 6908b1819e6b64ce3a2cbc33cccca10afda686efa60d6d91d4ce19213912f87e  rust-std-1.25.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256 1ebe2c241514b41b492772eded30d6c601f41cd68e493cb31ebbdd39ffc5c2e9  rust-std-1.25.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 28a6200b05b6ab870c0700eb371201f0790ca24e9b3b8982db62fd21c1e846e2  rust-std-1.25.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.25.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 30c724d3fa01eb7dd448ef4a1fe63f6caa59f70c250b7d2ec3ede6be29c2505f  rust-std-1.25.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 739acc03d50c5fb2ce43037b0b54c37ac99bd1bef9ea61ee969b49a63d11315d  rustc-1.27.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 d4c45e15d4ffb150f3eeef1fa2945a5ae541ab791f9464e9a4dcccba77bdf9c7  rustc-1.27.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256 1f9565cac16e600c68ebfb4fe50b1658462698b8d4a1e8392f8182c4e813d99d  rust-std-1.27.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256 a58026c1b441c45d21acc9b054232831fceb12f1906995754ef6aa9b20376d6a  rust-std-1.27.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 dc3ee826617487777bd70f52743baa499396c58cbdd3934cf57fa84624b84f05  rust-std-1.27.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256 d846df9113718e3faaf77c7b29690a4f9a9f1432e7d001e2a1fee95514d92c79  rust-std-1.27.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 68f028911a1606e93eb71bdf95fe7d91e2b4cbd247663f3ab1e59d291dcd61b7  rust-std-1.27.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips-unknown-linux-gnu.tar.xz.sha256
+sha256 e15358613566b4a7721cfbebf424f850c771cf2acfc67ea170154447e81a7d5d  rust-std-1.27.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 a2c8a030964515328cf1cff5d72a53e2d8df30048382318378904df6bd019395  rust-std-1.27.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+sha256 27444c6892c978d294d24e26409bf924b6644822d18ef1d3e0d4fa3370e7d4da  rust-std-1.27.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+sha256 ac0c03e7d53439821c2d9eaf1311716b92fe347d83c1009bc031907b4ddef0f2  rust-std-1.27.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256 d2f2b88adb85af25699dd5e866d8e989660ef1a94561a9b73e4b7080e75ef6ee  rust-std-1.27.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256 80b6070996f297f4e9f802b014e88285914de03c1af7b087064035c9ece500bf  rust-std-1.27.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 a3c1843a583af8a38d49a403ea4e3013c8e1e0092a37353e62e69957fa1e9dbd  rust-std-1.27.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.27.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 d3b0d00357cfaecf85651bea6f1d72793a5a859b6b07e9613ba21285922d5d58  rust-std-1.27.1-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index e10dbcebd0..cebca11133 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.25.0
+RUST_BIN_VERSION = 1.27.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
