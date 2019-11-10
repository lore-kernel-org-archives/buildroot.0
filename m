From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Nov 2019 21:41:51 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix small typo
Message-ID: <20191110204151.32640-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix small typo: oenvmtools -> openvmtools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 848551cfce..aa66a564a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,7 +147,7 @@ endif
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
-	bool "oenvmtools' procps support was removed"
+	bool "openvmtools' procps support was removed"
 	select BR2_LEGACY
 	help
 	  Upstream stopped supporting this option a while ago.
-- 
2.23.0
