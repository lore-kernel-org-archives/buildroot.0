From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:16:36 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libfm-extra: fix
 dependency comment
Message-ID: <20200510191328.F2D3C91343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad120f7335eacd2ebbd3048d4be59a4542393e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

According to the depends used the package does not need C++.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 08935f2a8610abaf3104eb62bc504221e572871d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfm-extra/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
index eefc022c4e..60e6fda30f 100644
--- a/package/libfm-extra/Config.in
+++ b/package/libfm-extra/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBFM_EXTRA
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm-extra needs a toolchain w/ wchar, threads, C++"
+comment "libfm-extra needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
