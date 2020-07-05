From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  5 Jul 2020 15:54:34 -0600
Subject: [Buildroot] [PATCH 1/2] package/python-greenlet: add x86_64 as
 supported arch
Message-ID: <20200705215435.148058-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was missed in 30f1decec2ca190deea072f4d490a8de830ac9a3.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index 44ab96b488..df95988ab5 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
-	default y if BR2_x86
+	default y if BR2_x86 || BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
-- 
2.25.1
