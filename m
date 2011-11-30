From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Nov 2011 08:10:59 -0300
Subject: [Buildroot] [PATCH 1/4] nbd: bump to version 2.9.24
Message-ID: <1322651462-20300-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 69a55ae..d9d0a85 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-NBD_VERSION = 2.9.15
+NBD_VERSION = 2.9.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
-NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
+NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 
-- 
1.7.3.4
