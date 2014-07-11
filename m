From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 13:37:06 -0300
Subject: [Buildroot] [PATCH] cifs-utils: bump to version 6.4
Message-ID: <1405096626-25067-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 3f4c71a..b672b56 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.3
-CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
-CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
+CIFS_UTILS_VERSION = 6.4
+CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
+CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
-- 
1.8.5.5
