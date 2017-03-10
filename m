From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 10 Mar 2017 16:22:10 +0100
Subject: [Buildroot] [PATCH] package/logrotate: fixes website in help,
	since logrotate is now hosted by github and fedorahosted.org has
	closed
Message-ID: <1489159330-11616-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/logrotate/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 8528361..2b1ae64 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LOGROTATE
 	help
 	  A simple program to rotate logs.
 
-	  https://fedorahosted.org/logrotate/
+	  https://github.com/logrotate/logrotate
 
 comment "logrotate needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-- 
2.1.4
