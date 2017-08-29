From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:01 +0200
Subject: [Buildroot] [PATCH 2/6] package/iostat: fix upstream source URL
In-Reply-To: <20170829191005.19697-1-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
Message-ID: <20170829191005.19697-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iostat/iostat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d591c67dc..4953c73ec 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IOSTAT_VERSION = 2.2
-IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_SITE = http://linuxinsight.com/sites/default/files
 IOSTAT_LICENSE = GPL
 IOSTAT_LICENSE_FILES = LICENSE
 
-- 
2.11.0
