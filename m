From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Dec 2011 09:22:25 +0100
Subject: [Buildroot] [git commit] nbd: bump to version 2.9.24
Message-ID: <20111205134651.E2CFC8F7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72958d1e4cddfc349527f9c9479f174b08ae7203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
