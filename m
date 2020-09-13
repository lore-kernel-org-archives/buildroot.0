From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Sun, 13 Sep 2020 13:32:53 +0200
Subject: [Buildroot] [PATCH v2 11/12] package/makedumpfile: add support for
 IBM s390x and Z arch
In-Reply-To: <20200913113254.1955447-1-egorenar@linux.ibm.com>
References: <20200913113254.1955447-1-egorenar@linux.ibm.com>
Message-ID: <20200913113254.1955447-12-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/makedumpfile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index a90ccbdf3c..d1efbc6e51 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_sparc64
+	default y if BR2_s390x || BR2_sparc64
 
 comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
-- 
2.26.2
