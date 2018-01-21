From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Jan 2018 21:25:35 +0100
Subject: [Buildroot] [PATCH] bfin-bf512: update to latest kernel
Message-ID: <20180121202534.GA9106@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/gdb/bfin-bf512/linux-4.6.config | 87 -----------------------------------
 board/gdb/bfin-bf512/linux.config     | 87 +++++++++++++++++++++++++++++++++++
 configs/gdb_bfin_bf512_defconfig      |  9 ++--
 3 files changed, 91 insertions(+), 92 deletions(-)
 delete mode 100644 board/gdb/bfin-bf512/linux-4.6.config
 create mode 100644 board/gdb/bfin-bf512/linux.config

diff --git a/board/gdb/bfin-bf512/linux-4.6.config b/board/gdb/bfin-bf512/linux-4.6.config
deleted file mode 100644
index bc2a907..0000000
--- a/board/gdb/bfin-bf512/linux-4.6.config
+++ /dev/null
@@ -1,87 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SYSVIPC=y
-CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-# CONFIG_RD_XZ is not set
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-# CONFIG_UID16 is not set
-# CONFIG_SGETMASK_SYSCALL is not set
-# CONFIG_SYSFS_SYSCALL is not set
-# CONFIG_KALLSYMS is not set
-# CONFIG_BUG is not set
-# CONFIG_BASE_FULL is not set
-# CONFIG_ADVISE_SYSCALLS is not set
-# CONFIG_MEMBARRIER is not set
-CONFIG_EMBEDDED=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_COMPAT_BRK is not set
-CONFIG_MODULES=y
-# CONFIG_BLOCK is not set
-CONFIG_BF512=y
-# CONFIG_SET_GENERIC_CLOCKEVENTS is not set
-# CONFIG_I_ENTRY_L1 is not set
-# CONFIG_EXCPT_IRQ_SYSC_L1 is not set
-# CONFIG_DO_IRQ_L1 is not set
-# CONFIG_CORE_TIMER_IRQ_L1 is not set
-# CONFIG_IDLE_L1 is not set
-# CONFIG_SCHEDULE_L1 is not set
-# CONFIG_ARITHMETIC_OPS_L1 is not set
-# CONFIG_ACCESS_OK_L1 is not set
-# CONFIG_MEMSET_L1 is not set
-# CONFIG_MEMCPY_L1 is not set
-# CONFIG_STRCMP_L1 is not set
-# CONFIG_STRNCMP_L1 is not set
-# CONFIG_STRCPY_L1 is not set
-# CONFIG_STRNCPY_L1 is not set
-# CONFIG_SYS_BFIN_SPINLOCK_L1 is not set
-# CONFIG_CACHELINE_ALIGNED_L1 is not set
-# CONFIG_DCACHE_FLUSH_L1 is not set
-# CONFIG_APP_STACK_L1 is not set
-# CONFIG_BFIN_INS_LOWOVERHEAD is not set
-# CONFIG_BFIN_ICACHE is not set
-# CONFIG_BFIN_DCACHE is not set
-# CONFIG_C_AMCKEN is not set
-CONFIG_BINFMT_ELF_FDPIC=y
-CONFIG_BINFMT_FLAT=y
-# CONFIG_COREDUMP is not set
-# CONFIG_SUSPEND is not set
-# CONFIG_UEVENT_HELPER is not set
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-# CONFIG_FW_LOADER is not set
-# CONFIG_ALLOW_DEV_COREDUMP is not set
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_BFIN=y
-CONFIG_SERIAL_BFIN_CONSOLE=y
-CONFIG_SERIAL_BFIN_UART0=y
-CONFIG_SERIAL_BFIN_UART1=y
-# CONFIG_BFIN_OTP is not set
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-# CONFIG_MANDATORY_FILE_LOCKING is not set
-# CONFIG_DNOTIFY is not set
-# CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="utf-8"
-CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
-# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_FTRACE is not set
-# CONFIG_DEBUG_VERBOSE is not set
-# CONFIG_DEBUG_HUNT_FOR_ZERO is not set
-# CONFIG_DEBUG_BFIN_HWTRACE_ON is not set
-CONFIG_EARLY_PRINTK=y
-# CONFIG_ACCESS_CHECK is not set
-# CONFIG_CRC32 is not set
diff --git a/board/gdb/bfin-bf512/linux.config b/board/gdb/bfin-bf512/linux.config
new file mode 100644
index 0000000..bc2a907
--- /dev/null
+++ b/board/gdb/bfin-bf512/linux.config
@@ -0,0 +1,87 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_UID16 is not set
+# CONFIG_SGETMASK_SYSCALL is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+# CONFIG_BLOCK is not set
+CONFIG_BF512=y
+# CONFIG_SET_GENERIC_CLOCKEVENTS is not set
+# CONFIG_I_ENTRY_L1 is not set
+# CONFIG_EXCPT_IRQ_SYSC_L1 is not set
+# CONFIG_DO_IRQ_L1 is not set
+# CONFIG_CORE_TIMER_IRQ_L1 is not set
+# CONFIG_IDLE_L1 is not set
+# CONFIG_SCHEDULE_L1 is not set
+# CONFIG_ARITHMETIC_OPS_L1 is not set
+# CONFIG_ACCESS_OK_L1 is not set
+# CONFIG_MEMSET_L1 is not set
+# CONFIG_MEMCPY_L1 is not set
+# CONFIG_STRCMP_L1 is not set
+# CONFIG_STRNCMP_L1 is not set
+# CONFIG_STRCPY_L1 is not set
+# CONFIG_STRNCPY_L1 is not set
+# CONFIG_SYS_BFIN_SPINLOCK_L1 is not set
+# CONFIG_CACHELINE_ALIGNED_L1 is not set
+# CONFIG_DCACHE_FLUSH_L1 is not set
+# CONFIG_APP_STACK_L1 is not set
+# CONFIG_BFIN_INS_LOWOVERHEAD is not set
+# CONFIG_BFIN_ICACHE is not set
+# CONFIG_BFIN_DCACHE is not set
+# CONFIG_C_AMCKEN is not set
+CONFIG_BINFMT_ELF_FDPIC=y
+CONFIG_BINFMT_FLAT=y
+# CONFIG_COREDUMP is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_BFIN=y
+CONFIG_SERIAL_BFIN_CONSOLE=y
+CONFIG_SERIAL_BFIN_UART0=y
+CONFIG_SERIAL_BFIN_UART1=y
+# CONFIG_BFIN_OTP is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MANDATORY_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="utf-8"
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+# CONFIG_DEBUG_VERBOSE is not set
+# CONFIG_DEBUG_HUNT_FOR_ZERO is not set
+# CONFIG_DEBUG_BFIN_HWTRACE_ON is not set
+CONFIG_EARLY_PRINTK=y
+# CONFIG_ACCESS_CHECK is not set
+# CONFIG_CRC32 is not set
diff --git a/configs/gdb_bfin_bf512_defconfig b/configs/gdb_bfin_bf512_defconfig
index 37ee728..6740647 100644
--- a/configs/gdb_bfin_bf512_defconfig
+++ b/configs/gdb_bfin_bf512_defconfig
@@ -8,15 +8,15 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/gdb/post-build.sh"
 
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gdb/bfin-bf512/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/gdb/bfin-bf512/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
@@ -31,4 +31,3 @@ BR2_PACKAGE_HOST_GDB=y
 # BR2_PACKAGE_HOST_GDB_TUI is not set
 # BR2_PACKAGE_HOST_GDB_PYTHON is not set
 BR2_PACKAGE_HOST_GDB_SIM=y
-
-- 
2.1.4
