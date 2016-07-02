From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:29 +0200
Subject: [Buildroot] [PATCH 60/69] dos2unix: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-61-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/dos2unix/dos2unix.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 82fa26f01307..df2094e4a564 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -9,7 +9,6 @@ DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-HOST_DOS2UNIX_DEPENDENCIES =
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
 DOS2UNIX_DEPENDENCIES += host-gettext
-- 
2.1.0
