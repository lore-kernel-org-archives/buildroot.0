From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:18 +0200
Subject: [Buildroot] [PATCH 05/16] sqlite: Version bump 3.8.4.2
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-6-git-send-email-bernd.kuhls@t-online.de>
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
index 7893e6b..af59479 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080401
+SQLITE_VERSION = 3080402
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
-- 
1.7.10.4
