From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Nov 2013 11:25:20 -0300
Subject: [Buildroot] [PATCH 2/4] cifs-utils: bump to version 6.2
In-Reply-To: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384179922-14765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1384179922-14765-2-git-send-email-gustavo@zacarias.com.ar>
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
index f715e36..4115d4e 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.1
+CIFS_UTILS_VERSION = 6.2
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
-- 
1.8.3.2
