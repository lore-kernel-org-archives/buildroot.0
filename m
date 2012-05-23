From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:35 -0300
Subject: [Buildroot] [PATCH 3/7] nbd: bump to version 3.1
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-3-git-send-email-gustavo@zacarias.com.ar>
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
index 62ae9be..15997af 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NBD_VERSION = 3.0
+NBD_VERSION = 3.1
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
-- 
1.7.3.4
