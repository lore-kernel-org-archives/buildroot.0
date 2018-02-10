From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 10 Feb 2018 22:16:38 +0200
Subject: [Buildroot] [PATCH] postgresql: update license file hash
Message-ID: <2d2c2eeb5a65d467ec93c2882c4efca4b88c57ae.1518293798.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copyright year update.

Fixes:
http://autobuild.buildroot.net/results/d79/d7989660584430945644e3a4406ba33cee22863d/
http://autobuild.buildroot.net/results/b51/b5141b64ed838caa1daca1bf4fe322dd2afaf0b5/
http://autobuild.buildroot.net/results/a37/a375d533036a1b95af32b6bda086e93174b8c5f0/

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 2950470fb950..bf3d2a8733cd 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -2,4 +2,4 @@
 sha256	fe32009b62ddb97f7f014307ce9d0edb6972f5a698e63cb531088e147d145bad	postgresql-10.2.tar.bz2
 
 # License file, Locally calculated
-sha256	7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676	COPYRIGHT
+sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
-- 
2.15.1
