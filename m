From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 May 2018 06:49:57 +0300
Subject: [Buildroot] [PATCH] execline: update license file hash
Message-ID: <f64dcf477f3f32287a3f231d2d1e0121f4383fdb.1525232997.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copyright year update.

Fixes:
http://autobuild.buildroot.net/results/250/250da80ec8d61884193d904a323dc86140c3f37f/
http://autobuild.buildroot.net/results/82a/82a45ac87270b7c8d8d9e97df865a7a76689b49a/
http://autobuild.buildroot.net/results/6a1/6a13dc487982bc63e3ac84bc7e6e6ad5208b17b5/

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/execline/execline.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index ea10ff1f9694..6bf3ccff6466 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256 f6993094766652041c21fde9c07ef53a3cd4b93a64123d9578fb4997a2cefca1  execline-2.5.0.0.tar.gz
-sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
+sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
-- 
2.17.0
