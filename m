From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 23:01:01 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix typo
Message-ID: <20210117220101.491914-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oriq-rcw -> qoriq-rcw

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a322d18cb3..4e59fbb190 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -162,7 +162,7 @@ config BR2_GDB_VERSION_8_2
 	  version such as 8.3 or more recent.
 
 config BR2_PACKAGE_HOST_RCW
-	bool "rcw package was renamed to oriq-rcw"
+	bool "rcw package was renamed to qoriq-rcw"
 	select BR2_PACKAGE_HOST_QORIQ_RCW
 	select BR2_LEGACY
 	help
-- 
2.29.2
