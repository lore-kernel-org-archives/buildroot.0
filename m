From: Florian La Roche <F.LaRoche@pilz.de>
Date: Tue, 5 Jun 2018 14:39:59 +0200
Subject: [Buildroot] [PATCH 1/1] More complete usage string.
Message-ID: <20180605123959.21925-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More complete usage string for the logging service.


Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 package/busybox/S01logging | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index 4632a4cc99..fcb3e7d236 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -33,7 +33,7 @@ case "$1" in
 	start
 	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart|reload}"
 	exit 1
 esac
 
-- 
2.17.0

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
