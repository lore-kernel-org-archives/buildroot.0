From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:29:09 +0200
Subject: [Buildroot] [git commit] package/Config.in: really remove devmem2
Message-ID: <20190923202412.B58738F194@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7123a3088c9d40ba4fb242d734b8bf1ac5dd912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 2fc11065f6..c336dfeda3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,7 +425,6 @@ endmenu
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
-	source "package/devmem2/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
