From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 14:25:28 +0000
Subject: [Buildroot] [PATCH 2/4] libplist: put depends before selects
In-Reply-To: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1448461530-56142-2-git-send-email-Vincent.Riera@imgtec.com>
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
index 4b2b529..5f96746 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBPLIST
 	bool "libplist"
-	select BR2_PACKAGE_LIBXML2
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBXML2
 	help
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
-- 
2.4.10
