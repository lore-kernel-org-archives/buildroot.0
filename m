From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] intltool: Fix spelling mistake
Message-ID: <20100608220138.418E9909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8df21528ed0d16bf52f743d1f20db381122271a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1987

intltool.mk has a typo, this patch fixes the problem.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    3 ++-
 package/intltool/{intltook.mk => intltool.mk} |    0
 2 files changed, 2 insertions(+), 1 deletions(-)
 rename package/intltool/{intltook.mk => intltool.mk} (100%)

diff --git a/CHANGES b/CHANGES
index 99cfd65..67c4348 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, gawk, iptables, libidn,
+	Updated/fixed packages: cdrkit, gawk, intltool, iptables, libidn,
 	netperf, openssl, php, qt, sqlite, tn5250, usbutils
 
 	Removed packages: modutils
@@ -25,6 +25,7 @@
 	#1945: PHP: add sqlite3 dependency when using external lib
 	#1951: Bump openssl to 0.9.8o
 	#1957: Bump sqlite to 3.6.23.1
+	#1987: intltool: Fix spelling mistake
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/intltool/intltook.mk b/package/intltool/intltool.mk
similarity index 100%
rename from package/intltool/intltook.mk
rename to package/intltool/intltool.mk
-- 
1.6.3.3
