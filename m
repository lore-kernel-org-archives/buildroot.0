From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:26:26 +0200
Subject: [Buildroot] [git commit] libcddb: add hash for license file
Message-ID: <20180428132846.01AA688F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99941e14b7ae0c177e3a4946d7fbd73d333d25a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcddb/libcddb.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcddb/libcddb.hash b/package/libcddb/libcddb.hash
index 9e60683ea3..f3519c2577 100644
--- a/package/libcddb/libcddb.hash
+++ b/package/libcddb/libcddb.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b	libcddb-1.3.2.tar.bz2
+sha256	7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852	COPYING
