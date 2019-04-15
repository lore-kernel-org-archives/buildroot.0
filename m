From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:29:40 +0200
Subject: [Buildroot] [git commit] package/libtool: add hash for license files
Message-ID: <20190415193031.38B218160A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d82bef73f561d0e32ad0568c2ee700ca83c93df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtool/libtool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index dd34c0d74f..e2adfa1897 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -2,3 +2,4 @@
 sha256	7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f	libtool-2.4.6.tar.xz
 # License files, locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	libltdl/COPYING.LIB
