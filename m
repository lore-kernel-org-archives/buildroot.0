From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:46:17 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump CodeSourcery
	AMD64 to 2015.11-139
Message-ID: <20160501125806.5C8C380153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14a75e09b92e164b7f0ca834dde2779e3cb05e03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From getting-started.pdf:
- Linker bug fix.
- Fix CVE 2015-7547 getaddrinfo.
- Breakpoint in non-existent file bug fix.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.hash | 4 ++--
 toolchain/toolchain-external/toolchain-external.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index d2118d0..3df19bb 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -28,8 +28,8 @@ sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
 # AMD64
-sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 a4de11669cddd4594f228db7bd38b0fed3c8692d1bac021739390b4c766bbd4f  amd-2015.11-36-x86_64-amd-linux-gnu.src.tar.bz2
+sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
 # Aarch64
 sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index bed0c8a..cd84395 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -353,7 +353,7 @@ TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
