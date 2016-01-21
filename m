From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 11:32:08 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libfontenc: select zlib
Message-ID: <20160121103225.C7545805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e61aaa7c49653df181061199f7ecd6f6007d58f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libfontenc depends on the zlib package but doesn't select it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libfontenc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index d2a3023..d25e96a 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
 	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_ZLIB
 	help
 	  X.Org fontenc library
