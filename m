From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 09:42:10 -0300
Subject: [Buildroot] [PATCH 2/2] nbd: add license information
In-Reply-To: <1366029730-15371-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366029730-15371-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366029730-15371-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 8a129f3..708e567 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -9,6 +9,7 @@ NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
+NBD_LICENSE = GPLv2
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
 # We have linux/falloc.h
-- 
1.8.1.5
