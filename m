From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Jan 2013 09:50:37 -0300
Subject: [Buildroot] [PATCH 1/4] e2fsprogs: bump to version 1.42.7
Message-ID: <1359118240-2397-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5b3b7d0..edc3e8e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.42.6
+E2FSPROGS_VERSION = 1.42.7
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
-- 
1.7.12.4
