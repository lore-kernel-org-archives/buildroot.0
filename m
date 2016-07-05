From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 08:47:24 +0200
Subject: [Buildroot] [git commit] iw: correct license name
Message-ID: <20160705064728.D27E9805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=095c74a959f7875325682767733bdd56b68a88a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iw license is ISC.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 200e703..6f3f309 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -7,7 +7,7 @@
 IW_VERSION = 4.7
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
-IW_LICENSE = iw license
+IW_LICENSE = ISC
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
