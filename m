From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:31:55 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: fix typo in nanopi-neo4 board
 name
Message-ID: <20200421191729.E1DF78FA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=990ebb1b18c50d157a669f67853a01b73ec00d13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 84ba2e8bf5f1e3a9d0d01a577f72cfd51f88a7b6 got the path to
board/friendlyarm/nanopi-neo4/ wrong in the DEVELOPERS file when
adding a new defconfig nanopi_neo4_defconfig. Let's fix the typo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56178ba100..c57bc1c5c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1614,7 +1614,7 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
-F:	board/friendlyarm/nanopi-m4/
+F:	board/friendlyarm/nanopi-neo4/
 F:	configs/nanopi_neo4_defconfig
 F:	package/libatasmart/
 F:	package/polkit/
