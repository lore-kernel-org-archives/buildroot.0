From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:54 +0200
Subject: [Buildroot] [PATCH v4 04/12] package/qemu: add IBM s390x and Z arch
 support
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-5-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 7ccf768d15..a7c0f7bf59 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -15,6 +15,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
 	default y if BR2_sh
 	default y if BR2_sparc
 	default y if BR2_sparc64
-- 
2.26.2
