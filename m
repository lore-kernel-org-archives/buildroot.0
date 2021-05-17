From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 May 2021 23:18:56 +0200
Subject: [Buildroot] [PATCH 1/2] Config.in.legacy: update iostat title
Message-ID: <20210517211857.1130768-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Specify that iostat 'package' has been removed to be consistent with
other entries

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bc7cb8e32a..7bd2eb1429 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -182,7 +182,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	  The package was renamed to containerd accordingly.
 
 config BR2_PACKAGE_IOSTAT
-	bool "iostat removed"
+	bool "iostat package removed"
 	select BR2_LEGACY
 	help
 	  This package has been removed, use sysstat instead.
-- 
2.30.2
