From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Sep 2014 11:06:02 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.12
Message-ID: <1409839562-30091-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fdd2e4e..810802d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.42.11
+E2FSPROGS_VERSION = 1.42.12
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
-- 
1.8.5.5
