From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu, 13 Aug 2020 10:41:18 +0200
Subject: [Buildroot] [package/rust-bump to version 1.45.2 1/2]
In-Reply-To: <1597308079-656-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597308079-656-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1597308079-656-2-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 67c537f..e2d3a48 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.40.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.40.0-src.tar.xz.asc
-sha256 6e2aa3a91697f4b225c6b394cbae6b97666f061dba491f666a5281698fe2aace  rustc-1.40.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.asc
+sha256 f8412adac2f5d974b2f06c5bd4be7361084d18a678d098bf05de5ccfa57b74a9  rustc-1.45.2-src.tar.xz
 # Locally generated
-sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index adcadc0..d62f7b7 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.40.0
+RUST_VERSION = 1.45.2
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.7.4
