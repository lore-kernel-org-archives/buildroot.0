From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed,  6 Jul 2016 10:50:47 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fix typo
Message-ID: <1467795047-4254-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Ben Boeckel who noticed it.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a135d3d..4101cb0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,7 +148,7 @@ comment "Legacy options removed in 2016.08"
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	help
-	  The systemd option te enable the compatibility libraries has
+	  The systemd option to enable the compatibility libraries has
 	  been removed. Theses libraries have been useless since a few
 	  version, and have been fully dropped from the source since
 	  v230.
-- 
2.8.1
