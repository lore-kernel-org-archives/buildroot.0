From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:34:00 +0200
Subject: [Buildroot] [git commit] libconfuse: add license information
Message-ID: <20140701224921.DAE749D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b33f4e98183e09e4b724aa2d64df0fbcfa002b37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libconfuse/libconfuse.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 66cabd3..8a0d80f 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -9,6 +9,8 @@ LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
 LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
+LIBCONFUSE_LICENSE = ISC
+LIBCONFUSE_LICENSE_FILES = src/confuse.c
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
