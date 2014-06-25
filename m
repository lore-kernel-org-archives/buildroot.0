From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:52:18 +0200
Subject: [Buildroot] [git commit] libraw1394: add license information
Message-ID: <20140625211213.E80909D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcf99eee738be2b859d4131fb49e55b45f8be719
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw1394/libraw1394.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 166c782..108dde9 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -8,5 +8,7 @@ LIBRAW1394_VERSION = 2.0.7
 LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_INSTALL_STAGING = YES
+LIBRAW1394_LICENSE = LGPLv2.1+
+LIBRAW1394_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
