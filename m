From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Nov 2014 15:08:09 +0000
Subject: [Buildroot] [PATCH] uclibc: fix the patches' numbering
Message-ID: <1416409689-39799-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some numbers where missing and some patches had the same number.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...3-syscall.patch => 0002-Add-dup3-syscall.patch} |    0
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |    0
 ...tch => 0004-Patch-from-OpenWRT-for-avr32.patch} |    0
 ...store-stack-pointer-just-after-return-fr.patch} |    0
 ....S-Add-missing-IT-instruction-for-Thumb2.patch} |    0
 ...-arm-move-check-for-BX-to-its-own-header.patch} |    0
 ...terp.patch => 0008-mips64-fix-n64-interp.patch} |    0
 ...009-Rules.mak-fix-breakage-from-603af30d.patch} |    0
 ...0-libc-add-non-standard-execvpe-function.patch} |    0
 ...=> 0011-libc-stdlib-add-mkostemp-helpers.patch} |    0
 ...entfd-Implement-eventfd2-and-fix-eventfd.patch} |    0
 ...vise.c.patch => 0013-add-posix_madvise.c.patch} |    0
 ...tl-sh-fix-race-condition-in-lll_wait_tid.patch} |    0
 ...-SIGCANCEL-to-the-list-of-blocked-signal.patch} |    0
 ...6-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch} |    0
 ...clude-elf.h-update-for-ELFOSABI_-changes.patch} |    0
 ...018-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...-authnone_marshal-in-multithreading-cont.patch} |    0
 ...-__syscall_error-callers-to-use-a0-for-a.patch} |    0
 ...instead-of-v0-for-__syscall_error-argume.patch} |    0
 ...e-.arm-mode-for-resolver-unconditionally.patch} |    0
 ...-getpid-behave-similar-to-the-common-one.patch} |    0
 ...scalls.h-allow-immediate-values-as-6th-s.patch} |    0
 ...0025-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch} |    0
 ... => 0026-inet-rpc-fix-build-in-NPTL-case.patch} |    0
 ...lement-assignment-allocation-m-character.patch} |    0
 ...ap-sys_mmap2-do-unsigned-shift-of-offset.patch} |    0
 ....patch => 0029-rpmatch-backport-function.patch} |    0
 ...ze.patch => 0030-statfs-support-f_frsize.patch} |    0
 ...-socket.h-pull-socket_type.h-from-eglibc.patch} |    0
 ...nt.h-update.patch => 0032-mount.h-update.patch} |    0
 ..._bits_syscall_h-do-not-leave-undefined-S.patch} |    0
 ...4-libc-sysdeps-sync-bits-in.h-with-glibc.patch} |    0
 ...reuse-free-slots-at-the-end-of-exit-func.patch} |    0
 ...me-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch} |    0
 ...e.patch => 0037-libc-add-posix_fallocate.patch} |    0
 ...fix-overflow-checking-in-int_add_no_wrap.patch} |    0
 ...dd-missing-SYMBOL_PREFIX-to-symbol-names.patch} |    0
 ...net-do-not-filter-responses-in-res_query.patch} |    0
 ...Remove-pragma-weak-for-undeclared-symbol.patch} |    0
 ...ting-the-nameserver-from-_res-state-afte.patch} |    0
 ...use-fputws_unlocked-S-F-instead-of-fputw.patch} |    0
 ...4-Fix-a-problem-with-scanning-wide-chars.patch} |    0
 ...gileness-in-dlopen-do_dlopen-wrapper-wor.patch} |    0
 ...open-implementation-from-statically-link.patch} |    0
 ...e-fix-backtrace-for-statically-linked-ap.patch} |    0
 ...ibubacktrace-fix-build-due-to-some-typos.patch} |    0
 ...licitly-include-uClibc_page.h-to-make-PA.patch} |    0
 ...-siginfo_h-add-a-missing-function-member.patch} |    0
 ...e-new-bits-scheme-for-arch-specific-flag.patch} |    0
 ..._NSIG-to-128-not-129.-This-matches-glibc.patch} |    0
 ...V_PAD_SIZE-takes-__WORDSIZE-into-account.patch} |    0
 ...tus.h-correctly-interpret-status-0x007f-.patch} |    0
 ...5-test-tls-fix-build-with-newer-binutils.patch} |    0
 ...nfig.patch => 0056-test-cater-for-config.patch} |    0
 ...patch => 0057-test-Fix-math-c-dependency.patch} |    0
 ...rking.patch => 0058-fix-sparc-networking.patch} |    0
 ...bdl-Also-include-dl-tls.h-for-for-SHARED.patch} |    0
 ...ptl-remove-duplicate-vfork-in-libpthread.patch} |    0
 ...rpc-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...arc-update-ptrace.h-to-latest-from-glibc.patch} |    0
 ...lude-__iconv_codesets-into-iconv-utility.patch} |    0
 62 files changed, 0 insertions(+), 0 deletions(-)
 rename package/uclibc/0.9.33.2/{0003-Add-dup3-syscall.patch => 0002-Add-dup3-syscall.patch} (100%)
 rename package/uclibc/0.9.33.2/{0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch => 0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch} (100%)
 rename package/uclibc/0.9.33.2/{0005-Patch-from-OpenWRT-for-avr32.patch => 0004-Patch-from-OpenWRT-for-avr32.patch} (100%)
 rename package/uclibc/0.9.33.2/{0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch => 0005-arm-clone-restore-stack-pointer-just-after-return-fr.patch} (100%)
 rename package/uclibc/0.9.33.2/{0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch => 0006-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch} (100%)
 rename package/uclibc/0.9.33.2/{0008-arm-move-check-for-BX-to-its-own-header.patch => 0007-arm-move-check-for-BX-to-its-own-header.patch} (100%)
 rename package/uclibc/0.9.33.2/{0009-mips64-fix-n64-interp.patch => 0008-mips64-fix-n64-interp.patch} (100%)
 rename package/uclibc/0.9.33.2/{0010-Rules.mak-fix-breakage-from-603af30d.patch => 0009-Rules.mak-fix-breakage-from-603af30d.patch} (100%)
 rename package/uclibc/0.9.33.2/{0011-libc-add-non-standard-execvpe-function.patch => 0010-libc-add-non-standard-execvpe-function.patch} (100%)
 rename package/uclibc/0.9.33.2/{0012-libc-stdlib-add-mkostemp-helpers.patch => 0011-libc-stdlib-add-mkostemp-helpers.patch} (100%)
 rename package/uclibc/0.9.33.2/{0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch => 0012-eventfd-Implement-eventfd2-and-fix-eventfd.patch} (100%)
 rename package/uclibc/0.9.33.2/{0015-add-posix_madvise.c.patch => 0013-add-posix_madvise.c.patch} (100%)
 rename package/uclibc/0.9.33.2/{0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch => 0014-nptl-sh-fix-race-condition-in-lll_wait_tid.patch} (100%)
 rename package/uclibc/0.9.33.2/{0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch => 0015-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch} (100%)
 rename package/uclibc/0.9.33.2/{0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch => 0016-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch} (100%)
 rename package/uclibc/0.9.33.2/{0019-include-elf.h-update-for-ELFOSABI_-changes.patch => 0017-include-elf.h-update-for-ELFOSABI_-changes.patch} (100%)
 rename package/uclibc/0.9.33.2/{0020-update-ptrace.h-to-latest-from-glibc.patch => 0018-update-ptrace.h-to-latest-from-glibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch => 0019-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch} (100%)
 rename package/uclibc/0.9.33.2/{0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch => 0020-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch} (100%)
 rename package/uclibc/0.9.33.2/{0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch => 0021-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch} (100%)
 rename package/uclibc/0.9.33.2/{0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch => 0022-ldso-use-.arm-mode-for-resolver-unconditionally.patch} (100%)
 rename package/uclibc/0.9.33.2/{0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch => 0023-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch} (100%)
 rename package/uclibc/0.9.33.2/{0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch => 0024-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch} (100%)
 rename package/uclibc/0.9.33.2/{0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch => 0025-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch} (100%)
 rename package/uclibc/0.9.33.2/{0029-inet-rpc-fix-build-in-NPTL-case.patch => 0026-inet-rpc-fix-build-in-NPTL-case.patch} (100%)
 rename package/uclibc/0.9.33.2/{0030-stdio-implement-assignment-allocation-m-character.patch => 0027-stdio-implement-assignment-allocation-m-character.patch} (100%)
 rename package/uclibc/0.9.33.2/{0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch => 0028-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch} (100%)
 rename package/uclibc/0.9.33.2/{0033-rpmatch-backport-function.patch => 0029-rpmatch-backport-function.patch} (100%)
 rename package/uclibc/0.9.33.2/{0034-statfs-support-f_frsize.patch => 0030-statfs-support-f_frsize.patch} (100%)
 rename package/uclibc/0.9.33.2/{0035-socket.h-pull-socket_type.h-from-eglibc.patch => 0031-socket.h-pull-socket_type.h-from-eglibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0036-mount.h-update.patch => 0032-mount.h-update.patch} (100%)
 rename package/uclibc/0.9.33.2/{0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch => 0033-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch} (100%)
 rename package/uclibc/0.9.33.2/{0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch => 0034-libc-sysdeps-sync-bits-in.h-with-glibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch => 0035-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch} (100%)
 rename package/uclibc/0.9.33.2/{0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch => 0036-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch} (100%)
 rename package/uclibc/0.9.33.2/{0041-libc-add-posix_fallocate.patch => 0037-libc-add-posix_fallocate.patch} (100%)
 rename package/uclibc/0.9.33.2/{0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch => 0038-nice-fix-overflow-checking-in-int_add_no_wrap.patch} (100%)
 rename package/uclibc/0.9.33.2/{0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch => 0039-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch} (100%)
 rename package/uclibc/0.9.33.2/{0044-inet-do-not-filter-responses-in-res_query.patch => 0040-inet-do-not-filter-responses-in-res_query.patch} (100%)
 rename package/uclibc/0.9.33.2/{0045-Remove-pragma-weak-for-undeclared-symbol.patch => 0041-Remove-pragma-weak-for-undeclared-symbol.patch} (100%)
 rename package/uclibc/0.9.33.2/{0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch => 0042-inet-fix-getting-the-nameserver-from-_res-state-afte.patch} (100%)
 rename package/uclibc/0.9.33.2/{0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch => 0043-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch} (100%)
 rename package/uclibc/0.9.33.2/{0048-Fix-a-problem-with-scanning-wide-chars.patch => 0044-Fix-a-problem-with-scanning-wide-chars.patch} (100%)
 rename package/uclibc/0.9.33.2/{0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch => 0045-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch} (100%)
 rename package/uclibc/0.9.33.2/{0050-libdl-fix-dlopen-implementation-from-statically-link.patch => 0046-libdl-fix-dlopen-implementation-from-statically-link.patch} (100%)
 rename package/uclibc/0.9.33.2/{0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch => 0047-libubacktrace-fix-backtrace-for-statically-linked-ap.patch} (100%)
 rename package/uclibc/0.9.33.2/{0052-libubacktrace-fix-build-due-to-some-typos.patch => 0048-libubacktrace-fix-build-due-to-some-typos.patch} (100%)
 rename package/uclibc/0.9.33.2/{0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch => 0049-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch} (100%)
 rename package/uclibc/0.9.33.2/{0055-siginfo_h-add-a-missing-function-member.patch => 0050-siginfo_h-add-a-missing-function-member.patch} (100%)
 rename package/uclibc/0.9.33.2/{0055-Use-new-bits-scheme-for-arch-specific-flag.patch => 0051-Use-new-bits-scheme-for-arch-specific-flag.patch} (100%)
 rename package/uclibc/0.9.33.2/{0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch => 0052-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch => 0053-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch} (100%)
 rename package/uclibc/0.9.33.2/{0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch => 0054-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch} (100%)
 rename package/uclibc/0.9.33.2/{0058-test-tls-fix-build-with-newer-binutils.patch => 0055-test-tls-fix-build-with-newer-binutils.patch} (100%)
 rename package/uclibc/0.9.33.2/{0059-test-cater-for-config.patch => 0056-test-cater-for-config.patch} (100%)
 rename package/uclibc/0.9.33.2/{0060-test-Fix-math-c-dependency.patch => 0057-test-Fix-math-c-dependency.patch} (100%)
 rename package/uclibc/0.9.33.2/{0061-fix-sparc-networking.patch => 0058-fix-sparc-networking.patch} (100%)
 rename package/uclibc/0.9.33.2/{0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch => 0059-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch} (100%)
 rename package/uclibc/0.9.33.2/{0062-nptl-remove-duplicate-vfork-in-libpthread.patch => 0060-nptl-remove-duplicate-vfork-in-libpthread.patch} (100%)
 rename package/uclibc/0.9.33.2/{0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch => 0061-powerpc-update-ptrace.h-to-latest-from-glibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0064-sparc-update-ptrace.h-to-latest-from-glibc.patch => 0062-sparc-update-ptrace.h-to-latest-from-glibc.patch} (100%)
 rename package/uclibc/0.9.33.2/{0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch => 0063-Do-not-include-__iconv_codesets-into-iconv-utility.patch} (100%)

diff --git a/package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch b/package/uclibc/0.9.33.2/0002-Add-dup3-syscall.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0003-Add-dup3-syscall.patch
rename to package/uclibc/0.9.33.2/0002-Add-dup3-syscall.patch
diff --git a/package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch b/package/uclibc/0.9.33.2/0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
rename to package/uclibc/0.9.33.2/0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
diff --git a/package/uclibc/0.9.33.2/0005-Patch-from-OpenWRT-for-avr32.patch b/package/uclibc/0.9.33.2/0004-Patch-from-OpenWRT-for-avr32.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0005-Patch-from-OpenWRT-for-avr32.patch
rename to package/uclibc/0.9.33.2/0004-Patch-from-OpenWRT-for-avr32.patch
diff --git a/package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch b/package/uclibc/0.9.33.2/0005-arm-clone-restore-stack-pointer-just-after-return-fr.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
rename to package/uclibc/0.9.33.2/0005-arm-clone-restore-stack-pointer-just-after-return-fr.patch
diff --git a/package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch b/package/uclibc/0.9.33.2/0006-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
rename to package/uclibc/0.9.33.2/0006-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
diff --git a/package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch b/package/uclibc/0.9.33.2/0007-arm-move-check-for-BX-to-its-own-header.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0008-arm-move-check-for-BX-to-its-own-header.patch
rename to package/uclibc/0.9.33.2/0007-arm-move-check-for-BX-to-its-own-header.patch
diff --git a/package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch b/package/uclibc/0.9.33.2/0008-mips64-fix-n64-interp.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0009-mips64-fix-n64-interp.patch
rename to package/uclibc/0.9.33.2/0008-mips64-fix-n64-interp.patch
diff --git a/package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch b/package/uclibc/0.9.33.2/0009-Rules.mak-fix-breakage-from-603af30d.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0010-Rules.mak-fix-breakage-from-603af30d.patch
rename to package/uclibc/0.9.33.2/0009-Rules.mak-fix-breakage-from-603af30d.patch
diff --git a/package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch b/package/uclibc/0.9.33.2/0010-libc-add-non-standard-execvpe-function.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0011-libc-add-non-standard-execvpe-function.patch
rename to package/uclibc/0.9.33.2/0010-libc-add-non-standard-execvpe-function.patch
diff --git a/package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch b/package/uclibc/0.9.33.2/0011-libc-stdlib-add-mkostemp-helpers.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0012-libc-stdlib-add-mkostemp-helpers.patch
rename to package/uclibc/0.9.33.2/0011-libc-stdlib-add-mkostemp-helpers.patch
diff --git a/package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch b/package/uclibc/0.9.33.2/0012-eventfd-Implement-eventfd2-and-fix-eventfd.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch
rename to package/uclibc/0.9.33.2/0012-eventfd-Implement-eventfd2-and-fix-eventfd.patch
diff --git a/package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch b/package/uclibc/0.9.33.2/0013-add-posix_madvise.c.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0015-add-posix_madvise.c.patch
rename to package/uclibc/0.9.33.2/0013-add-posix_madvise.c.patch
diff --git a/package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch b/package/uclibc/0.9.33.2/0014-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0016-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
rename to package/uclibc/0.9.33.2/0014-nptl-sh-fix-race-condition-in-lll_wait_tid.patch
diff --git a/package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch b/package/uclibc/0.9.33.2/0015-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0017-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
rename to package/uclibc/0.9.33.2/0015-librt-re-add-SIGCANCEL-to-the-list-of-blocked-signal.patch
diff --git a/package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch b/package/uclibc/0.9.33.2/0016-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0018-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
rename to package/uclibc/0.9.33.2/0016-ldso-include-dlfcn.h-for-RTLD_NODELETE.patch
diff --git a/package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch b/package/uclibc/0.9.33.2/0017-include-elf.h-update-for-ELFOSABI_-changes.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0019-include-elf.h-update-for-ELFOSABI_-changes.patch
rename to package/uclibc/0.9.33.2/0017-include-elf.h-update-for-ELFOSABI_-changes.patch
diff --git a/package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0018-update-ptrace.h-to-latest-from-glibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0020-update-ptrace.h-to-latest-from-glibc.patch
rename to package/uclibc/0.9.33.2/0018-update-ptrace.h-to-latest-from-glibc.patch
diff --git a/package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch b/package/uclibc/0.9.33.2/0019-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0022-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
rename to package/uclibc/0.9.33.2/0019-inet-rpc-fix-authnone_marshal-in-multithreading-cont.patch
diff --git a/package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch b/package/uclibc/0.9.33.2/0020-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0023-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
rename to package/uclibc/0.9.33.2/0020-MIPS-Convert-__syscall_error-callers-to-use-a0-for-a.patch
diff --git a/package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch b/package/uclibc/0.9.33.2/0021-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0024-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
rename to package/uclibc/0.9.33.2/0021-MIPS-Use-a0-instead-of-v0-for-__syscall_error-argume.patch
diff --git a/package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch b/package/uclibc/0.9.33.2/0022-ldso-use-.arm-mode-for-resolver-unconditionally.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0025-ldso-use-.arm-mode-for-resolver-unconditionally.patch
rename to package/uclibc/0.9.33.2/0022-ldso-use-.arm-mode-for-resolver-unconditionally.patch
diff --git a/package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch b/package/uclibc/0.9.33.2/0023-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0026-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
rename to package/uclibc/0.9.33.2/0023-make-NPTL-s-getpid-behave-similar-to-the-common-one.patch
diff --git a/package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch b/package/uclibc/0.9.33.2/0024-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0027-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
rename to package/uclibc/0.9.33.2/0024-i386-bits-syscalls.h-allow-immediate-values-as-6th-s.patch
diff --git a/package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch b/package/uclibc/0.9.33.2/0025-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0028-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
rename to package/uclibc/0.9.33.2/0025-dl-fix-dlsym-lookups-with-RTLD_NEXT.patch
diff --git a/package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch b/package/uclibc/0.9.33.2/0026-inet-rpc-fix-build-in-NPTL-case.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0029-inet-rpc-fix-build-in-NPTL-case.patch
rename to package/uclibc/0.9.33.2/0026-inet-rpc-fix-build-in-NPTL-case.patch
diff --git a/package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch b/package/uclibc/0.9.33.2/0027-stdio-implement-assignment-allocation-m-character.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0030-stdio-implement-assignment-allocation-m-character.patch
rename to package/uclibc/0.9.33.2/0027-stdio-implement-assignment-allocation-m-character.patch
diff --git a/package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch b/package/uclibc/0.9.33.2/0028-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0031-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
rename to package/uclibc/0.9.33.2/0028-mmap-sys_mmap2-do-unsigned-shift-of-offset.patch
diff --git a/package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch b/package/uclibc/0.9.33.2/0029-rpmatch-backport-function.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0033-rpmatch-backport-function.patch
rename to package/uclibc/0.9.33.2/0029-rpmatch-backport-function.patch
diff --git a/package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch b/package/uclibc/0.9.33.2/0030-statfs-support-f_frsize.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0034-statfs-support-f_frsize.patch
rename to package/uclibc/0.9.33.2/0030-statfs-support-f_frsize.patch
diff --git a/package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch b/package/uclibc/0.9.33.2/0031-socket.h-pull-socket_type.h-from-eglibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0035-socket.h-pull-socket_type.h-from-eglibc.patch
rename to package/uclibc/0.9.33.2/0031-socket.h-pull-socket_type.h-from-eglibc.patch
diff --git a/package/uclibc/0.9.33.2/0036-mount.h-update.patch b/package/uclibc/0.9.33.2/0032-mount.h-update.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0036-mount.h-update.patch
rename to package/uclibc/0.9.33.2/0032-mount.h-update.patch
diff --git a/package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch b/package/uclibc/0.9.33.2/0033-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0037-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
rename to package/uclibc/0.9.33.2/0033-buildsys-gen_bits_syscall_h-do-not-leave-undefined-S.patch
diff --git a/package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch b/package/uclibc/0.9.33.2/0034-libc-sysdeps-sync-bits-in.h-with-glibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0038-libc-sysdeps-sync-bits-in.h-with-glibc.patch
rename to package/uclibc/0.9.33.2/0034-libc-sysdeps-sync-bits-in.h-with-glibc.patch
diff --git a/package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch b/package/uclibc/0.9.33.2/0035-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0039-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
rename to package/uclibc/0.9.33.2/0035-libc-atexit-reuse-free-slots-at-the-end-of-exit-func.patch
diff --git a/package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch b/package/uclibc/0.9.33.2/0036-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0040-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
rename to package/uclibc/0.9.33.2/0036-mman-rename-MAP_UNINITIALIZE-to-MAP_UNINITIALIZED.patch
diff --git a/package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch b/package/uclibc/0.9.33.2/0037-libc-add-posix_fallocate.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0041-libc-add-posix_fallocate.patch
rename to package/uclibc/0.9.33.2/0037-libc-add-posix_fallocate.patch
diff --git a/package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch b/package/uclibc/0.9.33.2/0038-nice-fix-overflow-checking-in-int_add_no_wrap.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0042-nice-fix-overflow-checking-in-int_add_no_wrap.patch
rename to package/uclibc/0.9.33.2/0038-nice-fix-overflow-checking-in-int_add_no_wrap.patch
diff --git a/package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch b/package/uclibc/0.9.33.2/0039-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0043-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
rename to package/uclibc/0.9.33.2/0039-buildsys-Add-missing-SYMBOL_PREFIX-to-symbol-names.patch
diff --git a/package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch b/package/uclibc/0.9.33.2/0040-inet-do-not-filter-responses-in-res_query.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0044-inet-do-not-filter-responses-in-res_query.patch
rename to package/uclibc/0.9.33.2/0040-inet-do-not-filter-responses-in-res_query.patch
diff --git a/package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch b/package/uclibc/0.9.33.2/0041-Remove-pragma-weak-for-undeclared-symbol.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0045-Remove-pragma-weak-for-undeclared-symbol.patch
rename to package/uclibc/0.9.33.2/0041-Remove-pragma-weak-for-undeclared-symbol.patch
diff --git a/package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch b/package/uclibc/0.9.33.2/0042-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0046-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
rename to package/uclibc/0.9.33.2/0042-inet-fix-getting-the-nameserver-from-_res-state-afte.patch
diff --git a/package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch b/package/uclibc/0.9.33.2/0043-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0047-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
rename to package/uclibc/0.9.33.2/0043-_vfprintf.c-use-fputws_unlocked-S-F-instead-of-fputw.patch
diff --git a/package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch b/package/uclibc/0.9.33.2/0044-Fix-a-problem-with-scanning-wide-chars.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0048-Fix-a-problem-with-scanning-wide-chars.patch
rename to package/uclibc/0.9.33.2/0044-Fix-a-problem-with-scanning-wide-chars.patch
diff --git a/package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch b/package/uclibc/0.9.33.2/0045-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0049-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
rename to package/uclibc/0.9.33.2/0045-Fix-some-fragileness-in-dlopen-do_dlopen-wrapper-wor.patch
diff --git a/package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch b/package/uclibc/0.9.33.2/0046-libdl-fix-dlopen-implementation-from-statically-link.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0050-libdl-fix-dlopen-implementation-from-statically-link.patch
rename to package/uclibc/0.9.33.2/0046-libdl-fix-dlopen-implementation-from-statically-link.patch
diff --git a/package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch b/package/uclibc/0.9.33.2/0047-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0051-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
rename to package/uclibc/0.9.33.2/0047-libubacktrace-fix-backtrace-for-statically-linked-ap.patch
diff --git a/package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch b/package/uclibc/0.9.33.2/0048-libubacktrace-fix-build-due-to-some-typos.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0052-libubacktrace-fix-build-due-to-some-typos.patch
rename to package/uclibc/0.9.33.2/0048-libubacktrace-fix-build-due-to-some-typos.patch
diff --git a/package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch b/package/uclibc/0.9.33.2/0049-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0053-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
rename to package/uclibc/0.9.33.2/0049-libc-elf-explicitly-include-uClibc_page.h-to-make-PA.patch
diff --git a/package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch b/package/uclibc/0.9.33.2/0050-siginfo_h-add-a-missing-function-member.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0055-siginfo_h-add-a-missing-function-member.patch
rename to package/uclibc/0.9.33.2/0050-siginfo_h-add-a-missing-function-member.patch
diff --git a/package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch b/package/uclibc/0.9.33.2/0051-Use-new-bits-scheme-for-arch-specific-flag.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0055-Use-new-bits-scheme-for-arch-specific-flag.patch
rename to package/uclibc/0.9.33.2/0051-Use-new-bits-scheme-for-arch-specific-flag.patch
diff --git a/package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch b/package/uclibc/0.9.33.2/0052-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
rename to package/uclibc/0.9.33.2/0052-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
diff --git a/package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch b/package/uclibc/0.9.33.2/0053-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
rename to package/uclibc/0.9.33.2/0053-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
diff --git a/package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch b/package/uclibc/0.9.33.2/0054-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
rename to package/uclibc/0.9.33.2/0054-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch
diff --git a/package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch b/package/uclibc/0.9.33.2/0055-test-tls-fix-build-with-newer-binutils.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0058-test-tls-fix-build-with-newer-binutils.patch
rename to package/uclibc/0.9.33.2/0055-test-tls-fix-build-with-newer-binutils.patch
diff --git a/package/uclibc/0.9.33.2/0059-test-cater-for-config.patch b/package/uclibc/0.9.33.2/0056-test-cater-for-config.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0059-test-cater-for-config.patch
rename to package/uclibc/0.9.33.2/0056-test-cater-for-config.patch
diff --git a/package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch b/package/uclibc/0.9.33.2/0057-test-Fix-math-c-dependency.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0060-test-Fix-math-c-dependency.patch
rename to package/uclibc/0.9.33.2/0057-test-Fix-math-c-dependency.patch
diff --git a/package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch b/package/uclibc/0.9.33.2/0058-fix-sparc-networking.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0061-fix-sparc-networking.patch
rename to package/uclibc/0.9.33.2/0058-fix-sparc-networking.patch
diff --git a/package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch b/package/uclibc/0.9.33.2/0059-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
rename to package/uclibc/0.9.33.2/0059-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
diff --git a/package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch b/package/uclibc/0.9.33.2/0060-nptl-remove-duplicate-vfork-in-libpthread.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch
rename to package/uclibc/0.9.33.2/0060-nptl-remove-duplicate-vfork-in-libpthread.patch
diff --git a/package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0061-powerpc-update-ptrace.h-to-latest-from-glibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0063-powerpc-update-ptrace.h-to-latest-from-glibc.patch
rename to package/uclibc/0.9.33.2/0061-powerpc-update-ptrace.h-to-latest-from-glibc.patch
diff --git a/package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch b/package/uclibc/0.9.33.2/0062-sparc-update-ptrace.h-to-latest-from-glibc.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0064-sparc-update-ptrace.h-to-latest-from-glibc.patch
rename to package/uclibc/0.9.33.2/0062-sparc-update-ptrace.h-to-latest-from-glibc.patch
diff --git a/package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch b/package/uclibc/0.9.33.2/0063-Do-not-include-__iconv_codesets-into-iconv-utility.patch
similarity index 100%
rename from package/uclibc/0.9.33.2/0065-Do-not-include-__iconv_codesets-into-iconv-utility.patch
rename to package/uclibc/0.9.33.2/0063-Do-not-include-__iconv_codesets-into-iconv-utility.patch
-- 
1.7.1
