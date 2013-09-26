From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 26 Sep 2013 16:20:25 +0200
Subject: [Buildroot] [PATCH 1/1] atk: bump to version 2.10.0
Message-ID: <1380205225-4198-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/atk/atk.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 433e1e3..1a8bbea 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.9
-ATK_VERSION = $(ATK_VERSION_MAJOR).4
+ATK_VERSION_MAJOR = 2.10
+ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_LICENSE = LGPLv2+
-- 
1.7.9.5
