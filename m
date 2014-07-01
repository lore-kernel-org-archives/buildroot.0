From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:55:41 +0200
Subject: [Buildroot] [git commit] libmms: add license information
Message-ID: <20140701224922.0F50F9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8dc3422126951637e005eca39aafdc89c6ca200
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is LGPLv2.1+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmms/libmms.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 405729f..01c8d67 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -6,9 +6,9 @@
 
 LIBMMS_VERSION = 0.6.2
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
-
 LIBMMS_INSTALL_STAGING = YES
-
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
+LIBMMS_LICENSE = LGPLv2.1+
+LIBMMS_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
