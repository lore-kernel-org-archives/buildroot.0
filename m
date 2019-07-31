From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Jul 2019 23:11:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: fix license hash
Message-ID: <20190731211104.3817-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hash of license file was not updated after bump to version 1.1.23, year
and authors were updated by:
- https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=7a6c8a0df1b685d788fd4d3763681bb3018806d7
- https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=d6dcd4185bddff34724d6d539f834e9daf7dcf3d

Fixes:
 - http://autobuild.buildroot.org/results/bbf81a9f44768894c1a55bb1bac6728aff6f2431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/musl/musl.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 034393edd9..2e5c1c0a12 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
 # http://www.musl-libc.org/releases/musl-1.1.23.tar.gz.asc
 sha256  8a0feb41cef26c97dde382c014e68b9bb335c094bbc1356f6edaaf6b79bd14aa  musl-1.1.23.tar.gz
-sha256  a3ae1b9fc5d4938f5734734383b9813d27a5652df23010c6f9d4c5419b239a41  COPYRIGHT
+sha256  b349949ea277c203212aa85b42cdc5310527419e6fa0ce29fef7641abe194577  COPYRIGHT
-- 
2.20.1
