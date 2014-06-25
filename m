From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:50:23 +0200
Subject: [Buildroot] [git commit] libiqrf: add license information
Message-ID: <20140625211213.E23739D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ce7fc72ec7364ca7648df856992cfa226c879e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiqrf/libiqrf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index ec0d599..0531602 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -7,7 +7,7 @@
 LIBIQRF_VERSION = v0.1.2
 LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
-
 LIBIQRF_DEPENDENCIES = libusb
+LIBIQRF_LICENSE = LGPLv2.1+
 
 $(eval $(cmake-package))
