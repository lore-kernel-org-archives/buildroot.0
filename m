From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 21 Apr 2020 10:12:58 -0700
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove
 board/friendlyarm/nanopi-m4
Message-ID: <20200421171258.1893120-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When running get-developers the following warning is shown:
WARNING: 'board/friendlyarm/nanopi-m4/' doesn't match any file

This defconfig was removed with commit a24bd8936f57a590f810e14d7828cf1bddce580e
which was on August 29th of 2019.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56178ba100..85da3696c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1614,7 +1614,6 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
-F:	board/friendlyarm/nanopi-m4/
 F:	configs/nanopi_neo4_defconfig
 F:	package/libatasmart/
 F:	package/polkit/
-- 
2.25.3
