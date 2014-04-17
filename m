From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Apr 2014 18:42:17 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: version bump 3.8.4.3
Message-ID: <1397752937-28420-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b5104c9..901e5a7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080402
+SQLITE_VERSION = 3080403
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
-- 
1.7.10.4
