From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  1 Dec 2016 15:45:33 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: findfs is available in
	BR2_PACKAGE_UTIL_LINUX_BINARIES
Message-ID: <1480603533-34023-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

031659024b3cf27bb68dc58d07519b563ef472a1 removed the option
BR2_PACKAGE_UTIL_LINUX_FINDFS as it is always built by default.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..c2998d4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -615,7 +615,7 @@ config BR2_PACKAGE_E2FSPROGS_FINDFS
 	  This option attempted to enable findfs capabilities from
 	  e2fsprogs but has not worked since July 2015 (due to
 	  packaging changes). One can use BusyBox's findfs support or
-	  enable the BR2_PACKAGE_UTIL_LINUX_FINDFS option.
+	  enable the BR2_PACKAGE_UTIL_LINUX_BINARIES option.
 
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
-- 
2.1.4
