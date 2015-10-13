From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 14:27:25 +0100
Subject: [Buildroot] [PATCH buildroot-test 1/3] Add internal toolchain
	configuration for mipsel-r6-hf
Message-ID: <1444742847-43395-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../configs/br-mipsel-r6-hf-internal-full.config   |    4 ++++
 web/toolchains/configs/toolchain-configs.csv       |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 web/toolchains/configs/br-mipsel-r6-hf-internal-full.config

diff --git a/web/toolchains/configs/br-mipsel-r6-hf-internal-full.config b/web/toolchains/configs/br-mipsel-r6-hf-internal-full.config
new file mode 100644
index 0000000..0c338e9
--- /dev/null
+++ b/web/toolchains/configs/br-mipsel-r6-hf-internal-full.config
@@ -0,0 +1,4 @@
+BR2_mipsel=y
+BR2_mips_32r6=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index b2ff91c..dc4c7a6 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -16,6 +16,7 @@ http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x
 http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-mips64-n64-glibc.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-mipsel-o32-full.config,x86,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-mipsel-r6-hf-internal-full.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-nios2-glibc.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-powerpc-603e-basic-cpp.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-powerpc-e500mc-full.config,x86,uclibc
-- 
1.7.1
