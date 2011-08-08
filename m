From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Aug 2011 20:05:51 +0200
Subject: [Buildroot] [git commit] util-linux: fix
	BR2_PACKAGE_UTIL_LINUX_UUIDD option
Message-ID: <20110808180722.0161E8B840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01281da4573a2452bb17e3f968aa4f6a110180ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 570a1d1..d34759b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -35,7 +35,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),,--disable-libuuid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UUID),,--disable-uuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),,--disable-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),,--disable-libblkid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),,--disable-cramfs) \
-- 
1.7.3.4
