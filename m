From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Jan 2014 11:04:12 -0300
Subject: [Buildroot] [PATCH] minicom: bump to version 2.7
Message-ID: <1388585052-30553-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/minicom/minicom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 05004b8..e0a7cee 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.6.2
-MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3869/
+MINICOM_VERSION = 2.7
+MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3977/
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
-- 
1.8.3.2
