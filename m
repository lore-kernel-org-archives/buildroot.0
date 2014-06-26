From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:10:59 +0200
Subject: [Buildroot] [git commit] nbd: update icense information
Message-ID: <20140626151144.82D0B9D0D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=473ec1304cebf94f4565b5551f66155d0046e4fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
