From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 21:54:36 +0100
Subject: [Buildroot] [git commit] kodi: fix libva toolchain comment
Message-ID: <20160101205622.5F52F827C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7865a56947ce1a87bce9e304efa307e6518a5281
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documented syntax is '.. needs A toolchain ..'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9d3ea6f..124c8d5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -245,7 +245,7 @@ config BR2_PACKAGE_KODI_LIBVA
 	help
 	  Enable libva support.
 
-comment "libva support needs toolchain w/ dynamic library"
+comment "libva support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_KODI_WAVPACK
