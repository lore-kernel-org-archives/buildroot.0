From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 13 Jul 2015 22:57:08 -0400
Subject: [Buildroot] [PATCH v3 3/3] util-linux: put package options in a
	sub-menu
In-Reply-To: <1436842628-29469-1-git-send-email-danomimanchego123@gmail.com>
References: <1436842628-29469-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1436842628-29469-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hide all the util-linux options in a menuconfig, as the option
list is quite long.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/util-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 042cae0..c8d16d2 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_UTIL_LINUX
+menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-- 
1.9.1
