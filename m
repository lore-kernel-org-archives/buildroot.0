From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Sep 2020 19:16:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix tarball name in hash
 file
Message-ID: <20200914171659.3364205-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 819a4207f6a5c3b579cb5191b03b51ebec4298ff forgot to rename
libuhttpd-3.2.0.tar.gz

Fixes:
 - http://autobuild.buildroot.org/results/965be1c72996df94668be81d1e90ed6937fb9a7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 66fd2f07a2..b7c839a5f0 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.2.0.tar.gz
+sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.3.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
-- 
2.28.0
