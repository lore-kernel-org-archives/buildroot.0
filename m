From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:59 -0700
Subject: [Buildroot] [PATCH v2 11/13] package/udisks/Config.in: alphabatize
 package selection
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-12-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch makes the upcoming udisk2 version bump patch easier to read,
and also fixes the Config.in, so it follows Buildroot's package guidelines.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/udisks/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 04a632dd8d..2c0d0dab52 100644
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
 
-- 
2.26.2
