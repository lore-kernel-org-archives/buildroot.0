From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jan 2019 21:25:56 +0100
Subject: [Buildroot] [git commit] exempi: fix comment entry quote
Message-ID: <20190106202616.EA9CE826B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688ffc7ae1cae4f90f837256668458003394485f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following warning:
package/exempi/Config.in:14:warning: multi-line strings not supported

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exempi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exempi/Config.in b/package/exempi/Config.in
index 0fa4b473bc..ed71e0fb12 100644
--- a/package/exempi/Config.in
+++ b/package/exempi/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_EXEMPI
 
 	  http://libopenraw.freedesktop.org/wiki/Exempi
 
-comment "exempi needs a toolchain w/ C++, dynamic library, threads
+comment "exempi needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
