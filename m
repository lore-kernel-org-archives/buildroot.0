From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 13:52:50 -0300
Subject: [Buildroot] [PATCH 1/6] automake: bump to version 1.12.6
Message-ID: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/automake/automake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index ab4a1ac..94a84dd 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.11.6
+AUTOMAKE_VERSION = 1.12.6
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
-- 
1.8.1.5
