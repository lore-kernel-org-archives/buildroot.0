From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:09:18 +0100
Subject: [Buildroot] [git commit] package/openocd: indentation cleanup
Message-ID: <20170319131837.D76BB80584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea7532047d5141c7ed0335247ef2fa3793f33118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/openocd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 0d18365..8407bbc 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -108,7 +108,7 @@ HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
 # build system believe the documentation doesn't need to be
 # regenerated.
 define OPENOCD_FIX_VERSION_TEXI
-       touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
+	touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
 endef
 OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
 HOST_OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
