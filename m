From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:32 +0200
Subject: [Buildroot] [PATCH v1 12/28] package/jemalloc: eplace utf-8 space
 by ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-12-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	#?see include/jemalloc/internal/quantum.h
+	# see include/jemalloc/internal/quantum.h
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
--
2.21.0
