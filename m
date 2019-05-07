From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:58:41 +0200
Subject: [Buildroot] [git commit] package/jemalloc: eplace utf-8 space by
 ascii character
Message-ID: <20190507210158.0EFCE83B7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ba20a6c8f344be9babe73fd8e82054a05b4f825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jemalloc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index 2bf762903d..c272d4522c 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	bool
-	#??see include/jemalloc/internal/quantum.h
+	# see include/jemalloc/internal/quantum.h
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
