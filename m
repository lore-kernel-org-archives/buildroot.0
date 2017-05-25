From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 May 2017 20:34:55 +0200
Subject: [Buildroot] [for-next 1/3] package/gcc: remove old hashes (gcc 4.5,
	4.7, 4.8)
Message-ID: <20170525183457.12169-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.hash | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 7255d12..7a37bb6 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,9 +1,3 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.5.4/sha512.sum
-sha512  78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1dfaa5807617fc5248719f50b39c37ade0173ea5b9fec2091f4656115  gcc-4.5.4.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.7.4/sha512.sum
-sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189  gcc-4.7.4.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.5/sha512.sum
-sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.4/sha512.sum
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
-- 
2.9.4
