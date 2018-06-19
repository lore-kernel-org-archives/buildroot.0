From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jun 2018 20:19:38 +0200
Subject: [Buildroot] [PATCH 1/1] cargo-bin: add hash for powerpc64le
Message-ID: <20180619181938.24404-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/1e790bd13745cc0b3f03e6182e700c07d3b8a21c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cargo-bin/cargo-bin.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
index f01c3f5ff2..2dfea7c868 100644
--- a/package/cargo-bin/cargo-bin.hash
+++ b/package/cargo-bin/cargo-bin.hash
@@ -1,5 +1,7 @@
 # From https://static.rust-lang.org/dist/cargo-0.26.0-i686-unknown-linux-gnu.tar.xz.sha256
 sha256 bc5f5aa32d2f4ba26abf79a900231d06eecc7f1f2e125ed51bf71766550d1879  cargo-0.26.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.26.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256 b14b47f59b436d07e57c5eab5bdd7378842b8ef4873d5836e08f0391e743f516  cargo-0.26.0-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz.sha256
 sha256 aeaa5813aa6615dd7fdde6d870ca257c5b2e9da5e308f8242a08b231605bce0e  cargo-0.26.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
-- 
2.14.1
