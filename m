From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 14:25:27 +0000
Subject: [Buildroot] [PATCH 1/4] libplist: use the official project url
Message-ID: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libplist/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index c9d511b..4b2b529 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBPLIST
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
 
-	  http://cgit.sukimashita.com/libplist.git
+	  http://www.libimobiledevice.org/
 
 comment "libplist needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.4.10
