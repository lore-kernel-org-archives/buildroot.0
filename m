From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 22:59:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-um: drop ti-sgx-libgbm
 comment
Message-ID: <20201213215947.678631-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03 forgot to drop comment
from ti-sgx-um

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ti-sgx-um/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 6a8b7e87e3..b97469a364 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_TI_SGX_UM
 	bool "ti-sgx-um"
 	depends on BR2_PACKAGE_TI_SGX_KM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
-	depends on BR2_PACKAGE_HAS_UDEV # ti-sgx-libgbm
+	depends on BR2_PACKAGE_HAS_UDEV
 	# pre-built binaries
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBDRM
-- 
2.29.2
