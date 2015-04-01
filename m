From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  1 Apr 2015 21:48:59 +0200
Subject: [Buildroot] [PATCH 1/2] bmon: fix license information
Message-ID: <1427917740-17656-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bmon is licensed under two licenses BSD-2c and MIT.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bmon/bmon.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 9a4312f..b1dc399 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -7,8 +7,8 @@
 BMON_VERSION = 3.6
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
-BMON_LICENSE = BSD-2c
-BMON_LICENSE_FILES = LICENSE
+BMON_LICENSE = BSD-2c, MIT
+BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
 # For 0001-build-uclinux-is-also-linux.patch
 BMON_AUTORECONF = YES
 
-- 
2.1.0
