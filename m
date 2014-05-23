From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 21:43:48 -0300
Subject: [Buildroot] [PATCH] nbd: bump to version 3.8
Message-ID: <1400805828-12772-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index e5b5023..6c31180 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.3
-NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
+NBD_VERSION = 3.8
+NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
-- 
1.8.5.5
