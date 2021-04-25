From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 10:36:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: fix legal-info
Message-ID: <20210425083610.2307333-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 55a7382564e415dfcd29ebcf0b05577a6625d8ba forgot to update hash of
REAMDE.md (changes are not related to license:
https://github.com/opensvc/multipath-tools/commit/021c2df40f367559e5fa1cf3fe3734e4ec5854ae
https://github.com/opensvc/multipath-tools/commit/748d4453734937f372a930cfed3445f9903a9934)

Fixes:
 - http://autobuild.buildroot.org/results/9aa925b1a3fe8f0e38bef742c42304101b89b6b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index d83741cf08..7b8cfe98f6 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  afa9db94ff46f8d011251273f547ba958da6a0150a2b797b10fa8c8cfa74bbda  README.md
+sha256  b1bd70cc61ab014cc2e744af6b117db481ef4fa5d59cb3a21d86059935c666df  README.md
-- 
2.30.2
