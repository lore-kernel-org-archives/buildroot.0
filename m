From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:06:28 +0100
Subject: [Buildroot] [git commit] postgresql: update license file hash
Message-ID: <20180213210633.E13F288657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=005c52f4bd1b977fa94f168908eff48830ee4b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Copyright year update.

Fixes:
http://autobuild.buildroot.net/results/d79/d7989660584430945644e3a4406ba33cee22863d/
http://autobuild.buildroot.net/results/b51/b5141b64ed838caa1daca1bf4fe322dd2afaf0b5/
http://autobuild.buildroot.net/results/a37/a375d533036a1b95af32b6bda086e93174b8c5f0/

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 2950470fb9..bf3d2a8733 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -2,4 +2,4 @@
 sha256	fe32009b62ddb97f7f014307ce9d0edb6972f5a698e63cb531088e147d145bad	postgresql-10.2.tar.bz2
 
 # License file, Locally calculated
-sha256	7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676	COPYRIGHT
+sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
