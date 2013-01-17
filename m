From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jan 2013 09:25:40 -0300
Subject: [Buildroot] [PATCH 1/4] cifs-utils: bump to version 5.9
Message-ID: <1358425543-25435-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index d208c87..36f171d 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,4 +1,4 @@
-CIFS_UTILS_VERSION = 5.7
+CIFS_UTILS_VERSION = 5.9
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3
-- 
1.7.12.4
