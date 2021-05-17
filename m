From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 May 2021 23:18:57 +0200
Subject: [Buildroot] [PATCH 2/2] Config.in.lgeacy: fix udisks lvm2 help
In-Reply-To: <20210517211857.1130768-1-fontaine.fabrice@gmail.com>
References: <20210517211857.1130768-1-fontaine.fabrice@gmail.com>
Message-ID: <20210517211857.1130768-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove spurious "was removed"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7bd2eb1429..a0c1a6898f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,7 +152,7 @@ config BR2_PACKAGE_UDISKS_LVM2
 	help
 	  The lvm2 support was removed because udisks < 2.7.0 still
 	  depends on lvm2 application library, which was removed
-	  in was removed lvm2.
+	  in lvm2.
 
 config BR2_PACKAGE_LVM2_APP_LIBRARY
 	bool "lvm2 application library removed"
-- 
2.30.2
