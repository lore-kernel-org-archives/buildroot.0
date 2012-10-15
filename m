From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Oct 2012 19:15:17 -0300
Subject: [Buildroot] [PATCH] nbd: bump to version 3.2
Message-ID: <1350339317-22271-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index bd63caa..7733d7b 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NBD_VERSION = 3.1
+NBD_VERSION = 3.2
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
-- 
1.7.8.6
