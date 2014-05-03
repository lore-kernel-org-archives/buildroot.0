From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 22:29:02 +0200
Subject: [Buildroot] [git commit] libdrm: bump version to 2.4.54
Message-ID: <20140503202931.348399CAD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1f181af78196f3afbbcb236f4caccf192867e10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index bee1e77..b3e4d7a 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.53
+LIBDRM_VERSION = 2.4.54
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
