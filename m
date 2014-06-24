From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:52 -0300
Subject: [Buildroot] [PATCH 46/54] nbd: updatel icense information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-46-git-send-email-gustavo@zacarias.com.ar>
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
index 6c31180..7348e0e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -10,6 +10,7 @@ NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 NBD_LICENSE = GPLv2
+NBD_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # We have linux/falloc.h
-- 
1.8.5.5
