From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 11 Apr 2014 15:05:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/libatomic: mark as supporting
	aarch64
In-Reply-To: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
Message-ID: <1397225156-23112-2-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 3d5d0a8..290d0b0 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
 	help
 	  Atomic operations library
-- 
1.9.2
