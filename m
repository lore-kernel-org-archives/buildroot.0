From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:01:49 +0100
Subject: [Buildroot] [git commit] libusb-compat: add host variant
Message-ID: <20120202201521.9DCCC9099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee673bae770285eb8ab568fc486bfe4488e24ecc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove redundant HOST_*_DEPENDENCIES]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb-compat/libusb-compat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index e39cdd8..4f16489 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -19,3 +19,4 @@ endef
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
