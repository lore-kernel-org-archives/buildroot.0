From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 00:00:31 +0200
Subject: [Buildroot] [PATCH 1/1] libcsv: add hash for license file
Message-ID: <20180428220031.4216-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcsv/libcsv.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcsv/libcsv.hash b/package/libcsv/libcsv.hash
index e35c44f9b3..33a521d256 100644
--- a/package/libcsv/libcsv.hash
+++ b/package/libcsv/libcsv.hash
@@ -1,2 +1,3 @@
 #locally computed
 sha256 d9c0431cb803ceb9896ce74f683e6e5a0954e96ae1d9e4028d6e0f967bebd7e4  libcsv-3.0.3.tar.gz
+sha256 6876b170378d38f65aadd271485f0a5c45beaa043a7d3de5e1636ec927922c83  COPYING.LESSER
-- 
2.14.1
