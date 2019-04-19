From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 14:40:10 +0200
Subject: [Buildroot] [PATCH 3/4] package/jemalloc: add riscv support
In-Reply-To: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
References: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
Message-ID: <20190419124011.16721-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

riscv support has been added in version 4.2.0 with
https://github.com/jemalloc/jemalloc/commit/919e4a0ea92fbbf9b97efdf9f31a3c800f77cd8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jemalloc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index 9e87e3ca99..a320ae721d 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	default y if BR2_or1k
 	default y if BR2_sparc64
 	default y if BR2_powerpc
+	default y if BR2_riscv
 	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
 
 config BR2_PACKAGE_JEMALLOC
-- 
2.20.1
