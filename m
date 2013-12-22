From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 22 Dec 2013 16:01:32 +0800
Subject: [Buildroot] [PATCH] atk: bump to version 2.11.4
Message-ID: <1387699292.19488.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/atk/atk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 1a8bbea..fc65987 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.10
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
+ATK_VERSION_MAJOR = 2.11
+ATK_VERSION = $(ATK_VERSION_MAJOR).4
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_LICENSE = LGPLv2+
-- 
1.8.1.2
