From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Wed, 16 Sep 2020 07:59:28 +0200
Subject: [Buildroot] [PATCH v3 05/11] package/systemd: add support for IBM
 s390x and Z arch
In-Reply-To: <20200916055934.609436-1-egorenar@linux.ibm.com>
References: <20200916055934.609436-1-egorenar@linux.ibm.com>
Message-ID: <20200916055934.609436-6-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 74029aff05..7956370b83 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-- 
2.26.2
