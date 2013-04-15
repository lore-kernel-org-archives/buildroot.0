From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:44:51 +0200
Subject: [Buildroot] [git commit] nbd: add license information
Message-ID: <20130415215906.F2A5F9B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e59a641701196db47e74ee31d0a1c4e675fa1303
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/nbd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
