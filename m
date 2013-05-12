From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:16:21 +0200
Subject: [Buildroot] [git commit] libdrm: add license informations
Message-ID: <20130512202409.CD5DD9A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6ae18cccc82f04c8637d5acd6528e0753ab569e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdrm/libdrm.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 5dd276f..380bc1d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,9 +3,12 @@
 # libdrm
 #
 #############################################################
+
 LIBDRM_VERSION = 2.4.38
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
+LIBDRM_LICENSE = MIT
+
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
