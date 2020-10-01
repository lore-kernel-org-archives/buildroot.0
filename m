From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Oct 2020 17:56:20 +0200
Subject: [Buildroot] [PATCH 4/4]
 support/testing/tests/toolchain/test_external_bootlin: regenerate with new
 PowerPC toolchains
In-Reply-To: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
References: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201001155621.367441-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py  | 240 ++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 9f0df9788b..2edbfb3207 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -1553,6 +1553,186 @@ class TestExternalToolchainBootlinOpenriscUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinPowerpc440fpGlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc440fpGlibcStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc440fpMuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc440fpMuslStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc440fpUclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc440fpUclibcStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_440fp=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3MuslStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3UclibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpce300c3UclibcStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc=y
+        BR2_powerpc_e300c3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinPowerpce500mcGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1673,6 +1853,66 @@ class TestExternalToolchainBootlinPowerpc64e5500GlibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinPowerpc64e6500GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc64=y
+        BR2_powerpc_e6500=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc64e6500GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc64=y
+        BR2_powerpc_e6500=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc64e6500MuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_powerpc64=y
+        BR2_powerpc_e6500=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinPowerpc64e6500MuslStable(TestExternalToolchain):
+    config = """
+        BR2_powerpc64=y
+        BR2_powerpc_e6500=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "powerpc64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinPowerpc64power8GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
-- 
2.26.2
