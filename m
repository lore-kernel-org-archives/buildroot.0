From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 11:20:12 +0200
Subject: [Buildroot] [PATCH] package/urg: update homepage url
Message-ID: <20161015092012.1759-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/urg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/urg/Config.in b/package/urg/Config.in
index 9d57645..c602624 100644
--- a/package/urg/Config.in
+++ b/package/urg/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_URG
 	help
 	  Library to control Hokuyo's URG series sensors.
 
-	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+	  https://sourceforge.net/p/urgnetwork/wiki/Home/
 
 comment "urg needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.10.0
