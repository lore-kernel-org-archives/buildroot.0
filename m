From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 20:17:28 +0200
Subject: [Buildroot] [git commit] package/ti-sgx-um: fix Config.in
Message-ID: <20160716181734.1DD107FC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5dd6040821a5df948466ea9d116c089d1134c9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The continuation line was fogotten. However, it fits on a single line.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-sgx-um/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 2be6c06..8e1e4fb 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -2,8 +2,7 @@ comment "ti-sgx-um needs the ti-sgx-km driver"
 	depends on !BR2_PACKAGE_TI_SGX_KM
 
 comment "ti-sgx-um needs a glibc toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC ||
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TI_SGX_UM
 	bool "ti-sgx-um"
