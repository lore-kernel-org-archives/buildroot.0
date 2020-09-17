From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:57 +0200
Subject: [Buildroot] [PATCH v4 07/12] package/cmake: add support for IBM
 s390x and Z arch
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-8-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/cmake/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index e7bd14e69a..3c47fdcb49 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_m68k      || BR2_mips        || BR2_mips64   || \
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
-		BR2_i386      || BR2_x86_64      || BR2_xtensa
+		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
+		BR2_s390x
 
 config BR2_PACKAGE_CMAKE
 	bool
-- 
2.26.2
