From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:54:27 +0200
Subject: [Buildroot] [git commit] libconfuse: needs host-flex
Message-ID: <20140717205432.425939D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ae4e49ed454c981693ba3bfcf23fb4bc7f5c6bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/63f/63f6f6204058932b02f79eaaa44eb4555c5bbb1f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libconfuse/libconfuse.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index e9a1114..6450270 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -8,6 +8,7 @@ LIBCONFUSE_VERSION = V2_7
 LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
+LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = src/confuse.c
 
