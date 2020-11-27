From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Nov 2020 21:18:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.48.0
Message-ID: <20201127201826.97336-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/rust-lang/rust/blob/master/RELEASES.md#version-1480-2020-11-19

Fixes:
 - http://autobuild.buildroot.org/results/b30a19101b9c0eb39be300c6b4e64a7cd88f618c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rust-bin/rust-bin.hash | 94 +++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         | 10 ++--
 package/rust/rust.mk           |  2 +-
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index dd81edd581..cc3ea89b1f 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,48 +1,48 @@
-# From https://static.rust-lang.org/dist/rust-1.45.2-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.45.2-i686-unknown-linux-gnu.tar.xz.asc
-sha256 42c25bea5c6dc35e89c65217477880aa52ee95b85271192f7e6833c80f3761f0  rust-1.45.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 39455d1ebd6f386e50748f566e1b37780f236c1f3cbc869690653662beca1ea9  rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256 d0006b1ec413cd0f698195584cc478d3ceb44ea4232fe1971970be22f1470e1d  rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256 68ec96eadf94aa409a74e1ac1cf56c578c539cae8c238664b1805374037ac1b3  rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256 63d539b8ec09d6f555106a41278456dc443a88259eb4693f1c834b3dc2529616  rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256 f60ddfcbc6e7292b1b2a5145c93463cdc0e0811c95e3b426f629fcab9e24588b  rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz.asc
-sha256 05474dbec0385c8dcfd940e6f8954d4f8284745a4fbcf57932022b1593829463  rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz.asc
-sha256 6add56f405fac0306b7d966b842dfe6d6beb4eaa93492eac7ac74015ceaeba7e  rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256 107931f34646486211dcc582b6c4c58b17379025969b4d0f17c52d219483e66f  rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256 6f7dbbc7098c1a5af5e6490c8335eb8f8b8a53de9773199ac65c02e099956d58  rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256 6e7638cd370e0e5aa455d325a5f66b20c677fa3abb24bbf2519fc97ba3ac78ba  rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256 c6ad70fc0b052ceba0f886d2431dbd23fd444ad307c0f2f4932ccc7af246bd73  rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256 11edc189ea6544018ee74df7996d2ee8877a0d8b719a31b7e7a33d71bba9013c  rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256 0a000c2e047c675bee27c2287b2e03fe21148ead95c35b884846a8dc7c3c162d  rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 02309322467af8e37256ccf1f064f5233c7fca4423dffde0bd5eb32cde46942a  rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  ddbfb5af1cd2cb6ae79d6f3f95cf29c0057e6387eada8b3975e7d7658e315aae  rust-1.48.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  58270d8e10f72e1712ba08db6b8f8ffca64a63d1a7b220688b59fb05655b3843  rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  3a50eeb64a63a09f79bee49e01f72410d455b9ae1c7f07ebdb6dc0d40e9aa0bc  rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  f512696b54142abda3d68b2ba213ae115d5e898952a50a1fa3d1fe6b4ef71d3c  rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  5bc6c5dfcc9c345c3f7af519df8ac77c2b0938ea32aa7949f589bec2c7cd3a22  rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  da71ec82973eb6fdf67de25b5a39d9cb4b943ec2c43de570f4785a3a79036430  rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  d4ea5ca6f9c8f9092b50c879f1d9a2620486f08020fa4cac227743a19f6e8cdf  rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  5c4d49cbd16ac89e39c3cbfae127961289af3419435f2b90e1732a97d9326b35  rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  3fd7194abb8f51c3caf09c222c12700cddef73449d38953c6b1adb04a89dcc31  rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  9200f952416488bc68857989bc10239e59b44a6c55153cb063fa03f28f5016f8  rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  792008f6c9ea68db39e59312fc372bf649980cf676c01a71da7db399de49966c  rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  58d0da369bfd71a17d27807ef7c052556a771cf209bee068d44504f554bf2a8c  rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  10346635487b14aa4b82baeae02ee5a4bffe930090c6c551083262e9811755f0  rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  e42b64c5710d3982f22ed744ea21ef2f0196df908c6a673b6df550904583b1c3  rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  1c00a6a0dabbf6290728b09f9307d9fa6cc985487f727075c68acd4a600ef3f8  rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
-sha256 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 36557048c7..28901e0cfa 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.45.2
+RUST_BIN_VERSION = 1.48.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index e2d3a48e4f..1c993b9339 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.asc
-sha256 f8412adac2f5d974b2f06c5bd4be7361084d18a678d098bf05de5ccfa57b74a9  rustc-1.45.2-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.48.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.48.0-src.tar.xz.asc
+sha256  ff0a242392a1865d7b2d08eb5ca6c1b3fd0820741d4c13a51a4b2d5d2bb53908  rustc-1.48.0-src.tar.xz
 # Locally generated
-sha256 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index d62f7b7be7..798450e04e 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.45.2
+RUST_VERSION = 1.48.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.29.2
