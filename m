From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 14:27:26 +0100
Subject: [Buildroot] [PATCH buildroot-test 2/3] Add internal toolchain
	configuration for mips64el-r6-n64-hf
In-Reply-To: <1444742847-43395-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444742847-43395-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1444742847-43395-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../br-mips64el-r6-n64-hf-internal-full.config     |    5 +++++
 web/toolchains/configs/toolchain-configs.csv       |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 web/toolchains/configs/br-mips64el-r6-n64-hf-internal-full.config

diff --git a/web/toolchains/configs/br-mips64el-r6-n64-hf-internal-full.config b/web/toolchains/configs/br-mips64el-r6-n64-hf-internal-full.config
new file mode 100644
index 0000000..3d951b2
--- /dev/null
+++ b/web/toolchains/configs/br-mips64el-r6-n64-hf-internal-full.config
@@ -0,0 +1,5 @@
+BR2_mips64el=y
+BR2_mips_64r6=y
+BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index dc4c7a6..6c0bdb2 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -14,6 +14,7 @@ http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config,x8
 http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,x86,glibc
+http://autobuild.buildroot.org/toolchains/configs/br-mips64el-r6-n64-hf-internal-full.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-mips64-n64-glibc.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-mipsel-o32-full.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-mipsel-r6-hf-internal-full.config,x86,glibc
-- 
1.7.1
