From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 20:46:34 +0200
Subject: [Buildroot] [git commit] libsigsegv: update web page URL
Message-ID: <20160803185356.8A1DA81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=949c857464353d28e9392d619a5e8fd153403103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The web page has moved.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigsegv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 1f41f0d..90c6ba3 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBSIGSEGV
 	help
 	  Library for handling page faults in user mode.
 
-	  http://libsigsegv.sourceforge.net/
+	  http://www.gnu.org/software/libsigsegv/
 
 comment "libsigsegv needs a glibc toolchain"
 	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
