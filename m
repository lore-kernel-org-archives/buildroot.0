From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 10:41:45 +0100
Subject: [Buildroot] [git commit] package/ti-sgx-um: drop ti-sgx-libgbm
 comment
Message-ID: <20210102092358.EE4D6822C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96a8bedb3127c71ddb0b341683b3b1bd810f375b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03 forgot to drop comment
from ti-sgx-um

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
