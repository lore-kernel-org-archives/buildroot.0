From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 09:44:38 -0200
Subject: [Buildroot] [PATCH 3/3] libtool: bump to 2.4.2
In-Reply-To: <1330256678-26318-1-git-send-email-ismael.luceno@gmail.com>
References: <1330256678-26318-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330256678-26318-3-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/libtool/libtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6c69394..77c5d2e 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,7 +3,7 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 2.2.10
+LIBTOOL_VERSION = 2.4.2
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
-- 
1.7.9.1
