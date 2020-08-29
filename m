From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:14:42 +0200
Subject: [Buildroot] [git commit] package/udisks/Config.in: fix alphabetic
 ordering of selects
Message-ID: <20200902161639.A2BEA85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa1fddc9cd6dbefeb373dc8af7c0b4bfa31bf679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes the upcoming udisks2 version bump patch easier to
read, and also fixes the Config.in, so it follows Buildroot's package
guidelines.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udisks/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index f4044b0d0d..efd3b619bf 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -13,12 +13,12 @@ config BR2_PACKAGE_UDISKS
 	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_SG3_UTILS
-	select BR2_PACKAGE_POLKIT
-	select BR2_PACKAGE_PARTED
-	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LIBATASMART
 	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_SG3_UTILS
 	help
 	  The udisks project provides
 
