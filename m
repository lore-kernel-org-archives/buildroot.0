From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 09:44:37 -0200
Subject: [Buildroot] [PATCH 2/3] automake: bump to 1.11.3
In-Reply-To: <1330256678-26318-1-git-send-email-ismael.luceno@gmail.com>
References: <1330256678-26318-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330256678-26318-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/automake/automake.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 7f35f3f..9873191 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -3,8 +3,8 @@
 # automake
 #
 #############################################################
-AUTOMAKE_VERSION = 1.11.1
-AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
+AUTOMAKE_VERSION = 1.11.3
+AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
-- 
1.7.9.1
