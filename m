From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:23:25 -0300
Subject: [Buildroot] [PATCH 5/7] libnl: bump to version 3.2.21
In-Reply-To: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362133407-5840-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 35b2a51..7620cf7 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.18
+LIBNL_VERSION = 3.2.21
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
1.7.12.4
