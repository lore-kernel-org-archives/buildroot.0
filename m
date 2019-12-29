From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:28:10 +0100
Subject: [Buildroot] [git commit] package/ympd: add an upstream URL to
 Config.in
Message-ID: <20191229091905.A378E8E616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db751dfc6b54fd1c0bea4b246d809f394fe73acd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ympd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index 39b3a86d07..0a1c2b2fa7 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_YMPD
 	  ympd, a standalone MPD Web GUI written in C, utilizing
 	  Websockets and Bootstrap/JS
 
+	  https://www.ympd.org/
+
 comment "ympd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
