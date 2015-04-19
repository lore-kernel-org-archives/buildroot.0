From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:23 +0200
Subject: [Buildroot] [PATCH 04/19] package/hiawatha: bump version to 9.12
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hiawatha/hiawatha.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 76619e0..9a8ec15 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 9.2
+HIAWATHA_VERSION = 9.12
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
-- 
1.7.10.4
