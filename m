From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump X11 version to 7.5
Message-ID: <20100308133713.C400A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3437f2bee3e2adf58eb690e9ff7c493e683d43fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 84519ff..a333718 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,5 +1,5 @@
 menuconfig BR2_PACKAGE_XORG7
-	bool "X.org X Window System, X11R7, release 7.4"
+	bool "X.org X Window System, X11R7, release 7.5"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_EXPAT
-- 
1.6.3.3
