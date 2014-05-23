From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 22:07:17 +0200
Subject: [Buildroot] [git commit branch/next] nbd: bump to version 3.8
Message-ID: <20140523200855.C7B639C927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4023c4671e500fbc8b55ad6a2c9dacb64b88a959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
