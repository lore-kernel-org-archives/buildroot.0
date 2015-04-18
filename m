From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:34:13 +0200
Subject: [Buildroot] [git commit] bmon: drop stray AUTORECONF from last bump
Message-ID: <20150418133417.4999E7FC56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a401a69b7f6ff1f9f6a18471c724a2ac55f30c8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bmon/bmon.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index b1dc399..e430bf6 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -9,8 +9,6 @@ BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c, MIT
 BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
-# For 0001-build-uclinux-is-also-linux.patch
-BMON_AUTORECONF = YES
 
 # link dynamically unless explicitly requested otherwise
 ifeq ($(BR2_STATIC_LIBS),)
