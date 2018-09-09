From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:13:57 +0200
Subject: [Buildroot] [git commit] glibc: fix hash for LICENSES
Message-ID: <20180909131308.90A6B83895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37492e8b2d89b8e992a89f1ef6bda6afeb14433b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When bumping to 2.28, LICENSES file changed to remove the
stdio-common/tst-printf.c part:
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7

Fixes:
 - http://autobuild.buildroot.org/results/72824137037f675e4efe3284089451803f944abf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 85afd6fd6b..096393ff9b 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -5,4 +5,4 @@ sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     gli
 
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
+sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
