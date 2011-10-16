From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:27 -0300
Subject: [Buildroot] [PATCH 1/7] vala: bump to version 0.14.0
Message-ID: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index b1217cb..0a1aed0 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-VALA_VERSION = 0.12.1
-VALA_SITE = http://download.gnome.org/sources/vala/0.12
+VALA_VERSION = 0.14.0
+VALA_SITE = http://download.gnome.org/sources/vala/0.14
 VALA_SOURCE = vala-$(VALA_VERSION).tar.bz2
 VALA_DEPENDENCIES = host-flex libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
-- 
1.7.3.4
