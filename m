From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 13 Jan 2017 13:55:39 +0000
Subject: [Buildroot] [PATCH 1/2] toolchain: bump Codescape IMG MIPS version
	to 2016.05-06
Message-ID: <20170113135540.64589-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../toolchain-external-codescape-img-mips/Config.in                   | 2 +-
 .../toolchain-external-codescape-img-mips.hash                        | 4 ++--
 .../toolchain-external-codescape-img-mips.mk                          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 1f0d4d1..2250e17 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
index e4ae9e1..3d5703b 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
@@ -1,3 +1,3 @@
 # Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
-sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
+sha256 8d9cdf711dd402d7bf82883d425c221038fe8ce9d0c91a3f6b30939d9d55476c  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
index b4decfb..805e956 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-03
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-06
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
 
-- 
2.10.2
