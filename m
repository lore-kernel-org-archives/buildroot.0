From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 23:14:09 +0200
Subject: [Buildroot] [git commit] nbd: bump to version 3.2
Message-ID: <20121016212109.0374399884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d2b707f81a7cec96c6a275c273647304861511e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
