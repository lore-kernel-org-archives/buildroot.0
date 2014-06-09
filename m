From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jun 2014 11:04:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlite: Bump version to 3.8.5
Message-ID: <1402304666-9572-1-git-send-email-bernd.kuhls@t-online.de>
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
index 901e5a7..1fd76c8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080403
+SQLITE_VERSION = 3080500
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
-- 
1.7.10.4
